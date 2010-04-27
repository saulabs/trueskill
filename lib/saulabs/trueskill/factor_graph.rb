module Saulabs
  module TrueSkill
    
    class FactorGraph
      
      attr_reader :teams, :beta, :beta_squared, :draw_probability, :epsilon, :layers
      
      # @param teams (Array) 2 dimensional array of ratings
      def initialize(teams, ranks, options = {})
        @teams = teams
        @ranks = ranks
        @beta = options[:beta] || 25/6.0
        @draw_probability = options[:draw_probability] || 0.1
        @beta_squared = @beta**2
        @epsilon = -Math.sqrt(2.0 * @beta_squared) * Gauss::Distribution.inv_cdf((1.0 - @draw_probability) / 2.0)
        
        @prior_layer = Layers::PriorToSkills.new(self, @teams)
        @layers = [
          @prior_layer,
          Layers::SkillsToPerformances.new(self),
          Layers::PerformancesToTeamPerformances.new(self),
          Layers::IteratedTeamPerformances.new(self,
            Layers::TeamPerformanceDifferences.new(self),
            Layers::TeamDifferenceComparision.new(self, ranks)
          )
        ]
      end
      
      def draw_margin
        Gauss::Distribution.inv_cdf(0.5*(@draw_probability + 1)) * Math.sqrt(1 + 1) * @beta
      end
      
      def update_skills
        build_layers
        run_schedule
        @teams.each_with_index do |team, i|
          team.each_with_index do |player, j|
            player.replace(@prior_layer.output[i][j])
          end
        end
        ranking_probability
      end
      
    private
      
      def ranking_probability
        # factor_list = []
        # sum_log_z, sum_log_s = 0.0
        # @layers.each do |layer|
        #   layer.factors.each do |factor|
        #     factor.reset_marginals
        #     factor.messages.each_index { |i| sum_log_z += factor.send_message_at(i) }
        #     sum_log_s += factor.log_normalization
        #   end
        # end
        # Math.exp(sum_log_z + sum_log_s)
        0.0
      end
      
      def updated_skills
        @prior_layer.output
      end
      
      def build_layers
        output = nil
        @layers.each do |layer|
          layer.input = output
          layer.build
          output = layer.output
        end
      end
      
      def run_schedule
        schedules = @layers.map(&:prior_schedule) + @layers.reverse.map(&:posterior_schedule)
        Schedules::Sequence.new(schedules.compact).visit
      end
      
    end
    
  end
end
