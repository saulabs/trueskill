module Saulabs
  module TrueSkill
    
    class Calculator
      
      def self.update_skills(teams)
        graph = FactorGraph.new(teams, :tau => 0.1, :beta => 20, :draw_probability => 0.0)
        return graph.evaluate
      end
      
    end
    
  end
end