module Saulabs
  module TrueSkill
    module FactorGraphs
      
      class FactorGraph
        
        # layers: 
        def initialize(teams)
          @prior_layer = Saulabs::TrueSkill::Layers::PriorToSkills.new(teams)
          @layers = [
            @prior_layer,
            Saulabs::TrueSkill::Layers::SkillsToPerformances.new(self),
            Saulabs::TrueSkill::Layers::TeamDifferences.new(self)
          ]
          build
        end
        
        def run_schedule
          
        end
        
      private
        
        def build
          output = nil
          @layers.each do |layer|
            layer.input = output if output
            layer.build
            output = layer.output
          end
        end
        
      end
      
    end
  end
end
