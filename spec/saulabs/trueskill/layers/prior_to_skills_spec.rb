require File.dirname(__FILE__) + '/../../../spec_helper'

describe TrueSkill::Layers::PriorToSkills do
  
  before :each do 
    @teams = create_teams
    @graph = TrueSkill::FactorGraph.new(@teams)
    @layer = TrueSkill::Layers::PriorToSkills.new(@graph, @teams)
  end
  
  describe "#build" do
    
    it "should add 4 factors" do
      lambda {
        @layer.build
      }.should change(@layer.factors, :size).by(4)
    end
    
    it "should add 3 output variables" do
      lambda {
        @layer.build
      }.should change(@layer.output, :size).by(3)
    end
    
  end
  
  describe "#prior_schedule" do
    
    before :each do 
      @layer.build
    end
    
    it "should return a sequence-schedule" do
      @layer.prior_schedule.should be_kind_of(TrueSkill::Schedules::Sequence)
    end
    
  end
  
end