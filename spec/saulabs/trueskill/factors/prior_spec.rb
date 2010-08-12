# -*- encoding : utf-8 -*-
require File.expand_path('spec/spec_helper.rb')

describe TrueSkill::Factors::Prior do
  
  before :each do
    @variable = Gauss::Distribution.new
    @factor = TrueSkill::Factors::Prior.new(22.0, 0.3, @variable)
  end
  
  describe "#update_message_at" do
    
    it "should return a difference of 73.33333" do
      @factor.update_message_at(0).should be_close(73.33333, tolerance)
    end
  
  end
  
  describe "#log_normalization" do
    
    it "should be 0.0" do
      @factor.log_normalization.should == 0.0
    end
  
  end
  
end
