# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../../spec_helper'

describe Saulabs::TrueSkill::FactorGraph do
  
  before :each do
    @teams = create_teams
    @skill = @teams.first.first
    @graph = TrueSkill::FactorGraph.new(@teams, [1,2,3])
  end
  
  describe "#update_skills" do
    
    it "should update the mean of the first player in team1 to 29.61452" do
      @graph.update_skills
      @skill.mean.should be_close(29.61452, tolerance)
    end
    
    it "should update the deviation of the first player in team1 to 3.5036" do
      @graph.update_skills
      @skill.deviation.should be_close(3.5036, tolerance)
    end
    
  end
  
  describe "#draw_margin" do
    
    it "should be -0.998291" do
      @graph.draw_margin.should be_close(-0.998291, tolerance)
    end
    
  end
  
end

describe Saulabs::TrueSkill::FactorGraph do
  
  before :each do
    @teams = [
      [
        TrueSkill::Rating.new(8.3, 3.1, 0.8, 0.02),
        TrueSkill::Rating.new(3.0, 3.1, 0.8, 0.02),
        TrueSkill::Rating.new(2.2, 3.2, 0.8, 0.02)
      ],
      [
        TrueSkill::Rating.new(25.0, 8.3333, 0.8, 0.02)
      ]
    ]
    @skill = @teams.last.first
    @graph = TrueSkill::FactorGraph.new(@teams, [1,2], :beta => 25.0, :draw_probability => 0.0)
  end
  
  it "should do something" do
    40.times { TrueSkill::FactorGraph.new(@teams, [1,2], :beta => 15.0, :draw_probability => 0.0).update_skills }
    puts "#{@skill.to_s}"
  end
  
end
