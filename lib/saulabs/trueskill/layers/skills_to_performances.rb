module Saulabs
  module TrueSkill
    module Layers
    
      class SkillsToPerformances < Base
        
        def build
          @input.each do |team|
            team_performances = []
            team.each do |skill|
              variable = Gauss::Distribution.new
              @factors << Factors::Likelihood.new(@graph.beta_squared, skill, variable)
              team_performances << variable
            end
            @output << team_performances
          end
        end
        
        def prior_schedule
          Schedules::Sequence.new(@factors.map { |f| Schedules::Step.new(f, 0) })
        end
        
        def posterior_schedule
          Schedules::Sequence.new(@factors.map { |f| Schedules::Step.new(f, 1) })
        end
        
      end
    
    end
  end
end
