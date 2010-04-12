require File.dirname(__FILE__) + '/../spec_helper'

describe Saulabs::Gauss::Distribution, "#with_deviation" do
  
  before :each do 
    @dist = Saulabs::Gauss::Distribution.with_deviation(25.0, 8.333333)
  end

  it "should have a default mean value of 25.0" do
    @dist.mean.should == 25.0
  end

  it "should have a default deviation of 8.333333" do
    @dist.deviation.should be_close(8.333333, 0.000001)
  end

  it "should set the variance to 69.444438" do
    @dist.variance.should be_close(69.4444, 0.0001)
  end

  it "should set the precision to 0.0144" do
    @dist.precision.should be_close(0.0144, 0.0001)
  end

  it "should set the precision_mean to 0.36" do
    @dist.precision_mean.should be_close(0.36, 0.0001)
  end
  
end
  
describe Saulabs::Gauss::Distribution, "#with_precision" do
  
  before :each do 
    @dist = Saulabs::Gauss::Distribution.with_precision(0.36, 0.0144)
  end

  it "should have a default mean value of 25.0" do
    @dist.mean.should == 25.0
  end

  it "should have a default deviation of 8.333333" do
    @dist.deviation.should be_close(8.333333, 0.000001)
  end

  it "should set the variance to 69.444438" do
    @dist.variance.should be_close(69.4444, 0.0001)
  end

  it "should set the precision to 0.0144" do
    @dist.precision.should be_close(0.0144, 0.0001)
  end

  it "should set the precision_mean to 0.36" do
    @dist.precision_mean.should be_close(0.36, 0.0001)
  end
  
end

describe Saulabs::Gauss::Distribution, "absolute difference (-)" do
  
  before :each do 
    @dist = Saulabs::Gauss::Distribution.with_deviation(25.0, 8.333333)
  end
  
  it "should be 0.0 for the same distribution" do
    (@dist - @dist).should == 0.0
  end
  
  it "should equal the precision mean if the 0-distribution is subtracted" do
    (@dist - Saulabs::Gauss::Distribution.new).should == @dist.precision_mean
  end
  
end
