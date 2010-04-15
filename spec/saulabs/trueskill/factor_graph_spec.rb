require File.dirname(__FILE__) + '/../../spec_helper'

describe Saulabs::TrueSkill::FactorGraph do
  
  before :each do
    @teams = create_teams
    @graph = TrueSkill::FactorGraph.new(@teams, [1,2,3])
  end
  
  describe "#evaluate" do
    
    it "should do something" do
      result = @graph.evaluate
      puts "[#{result.last.flatten.map(&:to_s).join(', ')}]<br>"
      # puts "[#{result.first}]<br>"
      result.last[0][0].mean.should be_close(37.17611, tolerance)
      result.last[0][0].deviation.should be_close(5.5262, tolerance)
    end
    
  end
  
end