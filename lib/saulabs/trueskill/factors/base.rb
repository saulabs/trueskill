module Saulabs
  module TrueSkill
    module Factors
      
      class Base
        
        attr_accessor :messages, :bindings
        
        def initialize
          @messages = []
          @bindings = {}
        end
        
        def update_message_at(idx)
          raise "illegal message index: #{idx}" if idx < 0 || idx > message_count-1
          update_message(@messages[idx], @bindings[@messages[idx]])
        end
        
        def update_message(message, variable)
          raise "Abstract method Factors::Base#update_message(message, variable) called"
        end
        
        def message_count
          0
        end
        
        def log_normalisation
          0.0
        end
        
        def reset_marginals
          @bindings.values.each { |var| var.absorb!(Gauss::Distribution.with_deviation(0.0, 0.0)) }
        end
        
        def send_message_at(idx)
          self.send_message(@messages[idx], @bindings[@messages[idx]])
        end
        
        # message: normal distribution
        def send_message(message, variable)
          log_z = Saulabs::Gauss::Distribution.log_product_normalisation(message, variable)
          variable.absorb!(message * variable)
          return log_z
        end
        
        def bind(variable)
          message = Saulabs::Gauss::Distribution.new
          @messages << message
          @bindings[message] = variable
          return message
        end
        
      end
      
    end
  end
end
