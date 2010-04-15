module Saulabs
  module TrueSkill
    module Layers
      
      class Base
      
        attr_accessor :graph, :factors, :output, :input
      
        def initialize(graph)
          @graph = graph
          @factors = []
          @output = []
          @input = []
        end
        
        def build
          raise "Abstract method Layers::Base#build called"
        end
        
        def prior_schedule
          nil
        end
        
        def posterior_schedule
          nil
        end
      
      end
    
    end
  end
end
