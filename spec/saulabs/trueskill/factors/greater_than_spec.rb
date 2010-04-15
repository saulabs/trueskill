require File.dirname(__FILE__) + '/../../../spec_helper'

describe TrueSkill::Factors::GreaterThan do
  
  before :each do
    @variable = Gauss::Distribution.new(26.0, 1.1)
    @factor = TrueSkill::Factors::GreaterThan.new(0.1, @variable)
  end
  
  describe "#update_message_at" do
    
    it "should return a difference of 0.0" do
      @factor.update_message_at(0).should be_close(0.0, tolerance)
    end
  
  end
  
  describe "#log_normalization" do
    
    it "should be 0.0" do
      @factor.log_normalization.should == 0.0
    end
  
  end
  
end
