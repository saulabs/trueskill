require File.dirname(__FILE__) + '/../spec_helper'

describe "Rating" do
  
  describe 'initialize with deviation' do
    
    before :each do 
     @rating = TrueSkill::Rating.with_deviation(25.0, 8.333333)
    end
  
    it "should have a default mean value of 25.0" do
      @rating.mean.should == 25.0
    end
  
    it "should have a default deviation of 8.333333" do
      @rating.deviation.should be_close(8.333333, 0.000001)
    end
  
    it "should set the variance to 69.444438" do
      @rating.variance.should be_close(69.4444, 0.0001)
    end
  
    it "should set the precision to 0.0016" do
      @rating.precision.should be_close(0.0144, 0.0001)
    end
  
    it "should set the precision_mean to 0.04" do
      @rating.precision_mean.should be_close(0.36, 0.0001)
    end
  
  end
  
  describe 'initialize with precision' do
    
    before :each do 
     @rating = TrueSkill::Rating.with_precision(0.36, 0.0144)
    end
  
    it "should have a default mean value of 25.0" do
      @rating.mean.should == 25.0
    end
  
    it "should have a default deviation of 8.333333" do
      @rating.deviation.should be_close(8.333333, 0.000001)
    end
  
    it "should set the variance to 69.444438" do
      @rating.variance.should be_close(69.4444, 0.0001)
    end
  
    it "should set the precision to 0.0016" do
      @rating.precision.should be_close(0.0144, 0.0001)
    end
  
    it "should set the precision_mean to 0.04" do
      @rating.precision_mean.should be_close(0.36, 0.0001)
    end
  
  end
end
