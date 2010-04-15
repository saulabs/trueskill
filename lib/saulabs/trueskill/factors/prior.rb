module Saulabs
  module TrueSkill
    module Factors
      
      class Prior < Base
        
        # 
        def initialize(mean, variance, variable)
          super()
          @message = Gauss::Distribution.with_variance(mean, variance)
          bind(variable)
        end
        
        def update_message(message, variable)
          new_marginal = Gauss::Distribution.with_precision(
                           variable.precision_mean + @message.precision_mean - message.precision_mean,
                           variable.precision + @message.precision - message.precision
                         )
          diff = variable - message
          variable.replace(new_marginal)
          message.replace(@message)
          return diff
        end
        
        def message_count
          1
        end
        
      end
      
    end
  end
end