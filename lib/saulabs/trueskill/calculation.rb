module Saulabs
  module TrueSkill
    
    class Calculation
      
      @@tau = 1
      @@beta = 1
      @@draw_probability = 0.1
    
      @@tau_squared = @@tau**2
      @@beta_squared = @@beta**2
    
      def self.update_skills(game)
        graph = Saulabs::Gauss::FactorGraphs::FactorGraph.new
      end
    
      def self.match_quality(game)
      
      end
      
    end
    
  end
end