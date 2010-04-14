module Saulabs
  module TrueSkill
    
    class FactorGraph
      
      attr_reader :beta, :beta_squared, :tau, :tau_squared, :draw_probability, :epsilon
      
      def initialize(teams, options = {})
        @tau = options[:tau] || 0.1
        @beta = options[:beta] || 20
        @draw_probability = options[:draw_probability] || 0.1
        @tau_squared = tau**2
        @beta_squared = beta**2
        @epsilon = -Math.sqrt(2.0 * @beta_squared) * Gauss::Functions.inv_cdf((1.0 - @draw_probability) / 2.0)
        
        @prior_layer = Layers::PriorToSkills.new(self, teams)
        @layers = [
          @prior_layer
        ]
      end
      
      def evaluate
        build_layers
        run_schedule
        [ranking_probability, updated_skills]
      end
      
    private
      
      def ranking_probability
        factor_list = []
        sum_log_z = 0.0
        sum_log_s = 0.0
        @layers.each do |layer|
          layer.factors.each do |factor|
            factor.reset_marginals
            factor.messages.each_index { |i| sum_log_z += factor.send_message_at(i) }
            sum_log_s += factor.log_normalisation
          end
        end
        Math.exp(sum_log_z + sum_log_s)
      end
      
      def updated_skills
        @prior_layer.output
      end
      
      def build_layers
        output = nil
        @layers.each do |layer|
          layer.input = output if output
          layer.build
          output = layer.output
        end
      end
      
      def run_schedule
        schedules = []
        @layers.each do |layer|
          schedules << layer.create_prior_schedule
        end
        @layers.reverse.each do |layer|
          schedules << layer.create_posterior_schedule
        end
        Schedules::Sequence.new(schedules.compact).visit
      end
      
    end
    
  end
end
