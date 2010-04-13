module Saulabs
  module TrueSkill
    module FactorGraphs
      
      class Variable
        
        attr_accessor :value, :parent_index
        
        def initialize(value, parent_index)
          @value = value
          @parent_index = parent_index
        end
        
      end
      
    end
  end
end
