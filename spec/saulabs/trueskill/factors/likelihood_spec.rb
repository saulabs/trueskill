require File.dirname(__FILE__) + '/../../../spec_helper'

describe TrueSkill::Factors::Likelihood do
  
  before :each do
    @variable1 = Gauss::Distribution.new(26, 1.1)
    @variable2 = Gauss::Distribution.new
    @factor = TrueSkill::Factors::Likelihood.new(30, @variable1, @variable2)
  end
  
  describe "#update_message_at" do
    
    it "should return a difference of 0.0" do
      @factor.update_message_at(0).should be_close(0.0, tolerance)
    end
    
    it "should return a difference of 0.833066 for the second message" do
      @factor.update_message_at(0)
      @factor.update_message_at(1).should be_close(0.833066, tolerance)
    end
  
  end
  
  describe "#log_normalization" do
    
    it "should be 0.0" do
      @factor.log_normalization.should == 0.0
    end
  
  end
  
end