# -*- encoding : utf-8 -*-
require File.dirname(__FILE__) + '/../../../spec_helper'

describe TrueSkill::Factors::Prior do
  
  before :each do
    @variable = Gauss::Distribution.with_variance(0.0, 0.0)
    @variables = [
      Gauss::Distribution.new(22, 1.6),
      Gauss::Distribution.new(26, 2.5),
      Gauss::Distribution.new(31, 3.6)
    ]
    @factor = TrueSkill::Factors::WeightedSum.new(@variable, @variables, [0.5, 0.7, 0.8])
  end
  
  describe "weights" do
    
    it "should setup the weights correctly" do
      @factor.weights[0][0].should be_close(0.5, tolerance)
      @factor.weights[1][0].should be_close(-1.4, tolerance)
      @factor.weights[2][0].should be_close(-0.7142, tolerance)
      @factor.weights[2][1].should be_close(-1.14285, tolerance)
      @factor.weights[3][0].should be_close(-0.625, tolerance)
      @factor.weights[3][2].should be_close(1.25, tolerance)
    end
    
  end
  
  describe "weights_squared" do
    
    it "should setup the squared weights correctly" do
      @factor.weights_squared[0][0].should be_close(0.25, tolerance)
      @factor.weights_squared[1][0].should be_close(1.96, tolerance)
      @factor.weights_squared[2][0].should be_close(0.51, tolerance)
      @factor.weights_squared[2][1].should be_close(1.3061, tolerance)
      @factor.weights_squared[3][0].should be_close(0.3906, tolerance)
      @factor.weights_squared[3][2].should be_close(1.5625, tolerance)
    end
    
  end
  
  describe "index_order" do
    
    it "should setup the index order correctly" do
      @factor.index_order[0][0].should == 0
      @factor.index_order[1][0].should == 1
      @factor.index_order[2][0].should == 2
      @factor.index_order[2][1].should == 1
      @factor.index_order[2][2].should == 3
      @factor.index_order[3][1].should == 1
    end
    
  end
  
  describe "#update_message_at" do
    
    it "should return a difference of 4.50116 for message 0" do
      @factor.update_message_at(0).should be_close(4.50116, tolerance)
    end
  
  end
  
end
