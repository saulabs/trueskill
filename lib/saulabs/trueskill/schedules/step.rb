module Saulabs
  module TrueSkill
    module Schedules
      
      class Step < Base
        
        def initialize(factor, index)
          @factor = factor
          @index = index
        end
        
        def visit(depth = -1, max_depth = 0)
          puts "#{@factor.class}: #{@index}<br>"
          @factor.update_message_at(@index)
        end          
        
      end
      
    end
  end
end