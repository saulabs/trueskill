module Saulabs
  module TrueSkill
    module Layers
    
      class PriorToSkills < Base
      
        def initialize(graph, teams)
          super(graph)
          @teams = teams
        end
        
        def build
          @teams.each do |team|
            team_skills = []
            team.each do |skill|
              @factors << Factors::Prior.new(skill.mean, skill.variance + @graph.tau_squared, Gauss::Distribution.new)
              team_skills << skill
            end
            @output << team_skills
          end
        end
        
        def create_prior_schedule
          Schedules::Sequence.new(@factors.map { |f| Schedules::Step.new(f, 0) })
        end
        
      end
    
    end
  end
end
