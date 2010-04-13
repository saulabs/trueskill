module Saulabs
  module TrueSkill
    module Layers
    
      class PriorToSkills
      
        def initialize(teams)
          super
          teams.each do |team|
            team_skills = []
            team.each do |skill|
              variable = Saulabs::TrueSkill::FactorGraphs::Variable.new()
              @layers << Saulabs::TrueSkill::Factors::Prior.new(skill.mean, skill.deviation**2 + Saulabs::TrueSkill.tau, variable)
              team_skills << skill
            end
            @output << team_skills
          end
        end
        
      end
    
    end
  end
end
