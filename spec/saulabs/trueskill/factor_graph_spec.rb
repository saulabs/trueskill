require File.dirname(__FILE__) + '/../../spec_helper'

describe Saulabs::TrueSkill::FactorGraph do
  
  before :each do
    @teams = [
      [Saulabs::Gauss::Distribution.with_deviation(25, 25/3.0)],
      [Saulabs::Gauss::Distribution.with_deviation(25, 25/3.0)]
    ]
    @graph = Saulabs::TrueSkill::FactorGraph.new(@teams, :tau => 0.1, :beta => 20, :draw_probability => 0.0)
    @result = @graph.evaluate
  end
  
  it "should do something" do
  end
  
end