# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../../../spec_helper'

describe TrueSkill::Factors::GreaterThan do
  
  before :each do
    @variable = Gauss::Distribution.new(0.1, 1.1)
    @factor = TrueSkill::Factors::GreaterThan.new(0.1, @variable)
  end
  
  describe "#update_message_at" do
    
    it "should return a difference of 2.1409" do
      @factor.update_message_at(0).should be_close(2.1409, tolerance)
    end
  
  end
  
  describe "#log_normalization" do
    
    it "should be -0.69314" do
      @factor.log_normalization.should be_close(-0.69314, tolerance)
    end
  
  end
  
end
