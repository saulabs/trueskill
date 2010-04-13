module Saulabs
  module TrueSkill
    module Layers
      
      class Base
      
        attr_accessor :factors, :output, :input
      
        def initialize
          @factors = []
          @output = []
          @input = []
        end
      
      end
    
    end
  end
end
