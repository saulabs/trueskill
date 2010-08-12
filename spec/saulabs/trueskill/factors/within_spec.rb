# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../../../spec_helper'

describe TrueSkill::Factors::Within do
  
  before :each do
    @variable = Gauss::Distribution.new(1.0, 1.1)
    @factor = TrueSkill::Factors::Within.new(0.01, @variable)
  end
  
  describe "#update_message_at" do
    
    it "should return a difference of 173.2048" do
      @factor.update_message_at(0).should be_close(173.2048, tolerance)
    end
  
  end
  
  describe "#log_normalization" do
    
    it "should be -5.339497" do
      @factor.log_normalization.should be_close(-5.339497, tolerance)
    end
  
  end
  
end
