require File.dirname(__FILE__) + '/../../spec_helper'

describe Saulabs::TrueSkill::FactorGraph do
  
  before :each do
    @teams = create_teams
    @graph = TrueSkill::FactorGraph.new(@teams, :tau => 0.1, :beta => 20, :draw_probability => 0.0)
  end
  
  describe "#evaluate" do
    
    it "should do something" do
      result = @graph.evaluate
      puts "[#{result.last.flatten.map(&:to_s).join(', ')}]<br>"
      puts "[#{result.first}]<br>"
    end
    
    it "should do something" do
      raise (Gauss::Distribution.with_deviation(25, 25/3.0) - Gauss::Distribution.with_deviation(25, 25/1.5)).inspect
    end
    
  end
  
end