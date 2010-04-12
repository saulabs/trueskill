module Saulabs
  module Gauss
    module Factors
      
      class BaseFactor
        
        attr_accessor :messages, :binding, :variables
        
        def initialize
          @messages = []
          @binding = {}
          @variables = []
        end
        
        def send_message(message, variable)
          log_z = Distribution.log_product_normalisation(message.value, variable.value)
          variable.value = message.value * variable.value
          return log_z
        end
        
      end
      
      class GreaterThanFactor < BaseFactor
        
        attr_accessor :epsilon, :vaiable
        
        def initialize(epsilon, variable)
          @epsilon = epsilon
          @variable = variable 
        end
        
      end
      
    end
  end
end
