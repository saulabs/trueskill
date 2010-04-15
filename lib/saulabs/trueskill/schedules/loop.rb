module Saulabs
  module TrueSkill
    module Schedules
      
      class Loop < Base
        
        def initialize(schedule, max_delta)
          @schedule = schedule
          @max_delta = max_delta
        end
        
        def visit(depth = -1, max_depth = 0)
          iterations = 1
          delta = @schedule.visit(depth + 1, max_depth)
          puts "loop delta: #{delta}<br>"
          while delta > @max_delta
            delta = @schedule.visit(depth + 1, max_depth)
            puts "loop delta: #{delta}<br>"
            iterations += 1
          end
          delta
        end
        
      end
      
    end
  end
end