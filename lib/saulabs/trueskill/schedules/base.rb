module Saulabs
  module TrueSkill
    module Schedules
      
      class Base
        
        def visit(depth = -1, max_depth = 0)
          raise "Abstract method Schedules::Base#visit(depth, max_depth) called"
        end
        
      end
      
    end
  end
end