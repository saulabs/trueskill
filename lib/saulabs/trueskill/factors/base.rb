module Saulabs
  module TrueSkill
    module Factors
      
      class Base
        
        attr_accessor :messages, :binding, :variables
        
        def initialize
          @messages = []
          @binding = {}
          @variables = []
        end
        
        def update_message_at(idx)
          update_message(@messages[idx], @binding[@messages[idx]])
        end
        
        def update_message(message, variable)
          raise "Abstract method Gauss::Factors::Base#update_message(message, variable) called"
        end
        
        def reset_marginals
          @binding.values.each { |var| var.reset_to_prior }
        end
        
        def send_message_at(idx)
          self.send_message(@messages[idx], @binding[@messages[idx]])
        end
        
        # message: normal distribution
        def send_message(message, variable)
          log_z = Saulabs::Gauss::Distribution.log_product_normalisation(message, variable.value)
          variable.value = message.value * variable.value
          return log_z
        end
        
        def bind(variable)
          message = Saulabs::Gauss::Distribution.new
          @messages << message
          @binding[message] = variable
          @variables << variable
          return message
        end
        
      end
      
    end
  end
end
