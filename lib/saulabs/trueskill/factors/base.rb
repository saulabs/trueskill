module Saulabs
  module TrueSkill
    module Factors
      
      class Base
        
        attr_accessor :messages, :bindings
        
        def initialize
          @messages = []
          @bindings = {}
          @priors = []
        end
        
        def update_message_at(index)
          raise "Abstract method Factors::Base#update_message_at(index) called"
        end
        
        def log_normalization
          raise "Abstract method Factors::Base#log_normalization called"
        end
        
        def reset_marginals
          @bindings.values.each { |var| var.replace(Gauss::Distribution.new) }
        end
        
        def send_message_at(idx)
          self.send_message(@messages[idx], @bindings[@messages[idx]])
        end
        
        def send_message(message, variable)
          log_z = Gauss::Distribution.log_product_normalization(message, variable)
          variable.replace(message * variable)
          return log_z
        end
        
        def bind(variable)
          message = Gauss::Distribution.new
          @messages << message
          @bindings[message] = variable
          return message
        end
        
      end
      
    end
  end
end
