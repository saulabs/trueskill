module Saulabs
  module TrueSkill
    module Factors
      
      class Prior < Saulabs::TrueSkill::Factors::Base
        
        attr_accessor :message
        
        def initialize(mean, variance, variable)
          super
          @message = Saulabs::Gauss::Distribution.with_deviation(mean, Math.sqrt(variance))
          bind(variable)
        end
        
        def update_message(message, variable)
          old_marginal = variable.value.clone
          old_message = message.clone
          new_marginal = generate_new_marginal(old_marginal, old_message)
          variable.value = new_marginal
          message = @message
          return old_marginal - new_marginal
        end
        
        private
        
        def generate_new_marginal(old_marginal, old_message)
          Saulabs::Gauss::Distribution.with_precision(
            old_marginal.precision_mean + @message.precision_mean - old_message.precision_mean,
            old_marginal.precision + @message.precision - old_message.precision
          )
        end
        
      end
      
    end
  end
end