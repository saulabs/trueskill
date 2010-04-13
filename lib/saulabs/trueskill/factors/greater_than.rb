module Saulabs
  module TrueSkill
    module Factors
      
      class GreaterThan < Base
        
        attr_accessor :epsilon, :vaiable
        
        def initialize(epsilon, variable)
          @epsilon = epsilon
          @variable = variable 
        end
        
        def update_message(message, variable)
          
        end
        
      end
      
    end
  end
end
