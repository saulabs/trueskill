require File.dirname(__FILE__) + '/../../../spec_helper'

describe TrueSkill::Factors::Prior do
  
  before :each do
    @variable = Gauss::Distribution.with_variance(9.0, 10.0)
    @factor = TrueSkill::Factors::Prior.new(9.0, 9.0, @variable)
  end
  
  describe "#initialize" do
    
    it "should have one message" do
      @factor.messages.should have(1).items
    end
    
    it "should have one binding" do
      @factor.bindings.should have(1).items
    end
  
  end
  
  describe "#update_message_at" do
    
    it "should return a difference of 0.9" do
      @factor.update_message_at(0).should be_close(0.9, 0.01)
    end
    
    it "should change the variance of the variable" do
      lambda {
        @factor.update_message_at(0)
      }.should change(@variable, :variance)
    end
    
    it "should change the deviation of the variable" do
      lambda {
        @factor.update_message_at(0)
      }.should change(@variable, :deviation)
    end
    
    it "should not change the mean of the variable" do
      lambda {
        @factor.update_message_at(0)
      }.should_not change(@variable, :mean)
    end
    
    it "should change the variance of the message" do
      lambda {
        @factor.update_message_at(0)
      }.should change(@factor.messages.first, :variance)
    end
    
    it "should change the deviation of the message" do
      lambda {
        @factor.update_message_at(0)
      }.should change(@factor.messages.first, :deviation)
    end
    
    it "should change the mean of the message" do
      lambda {
        @factor.update_message_at(0)
      }.should change(@factor.messages.first, :mean)
    end
  
  end
  
end