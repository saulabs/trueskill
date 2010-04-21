require File.dirname(__FILE__) + '/../../spec_helper'

describe Gauss::Distribution, "#initialize" do

  it "should set the mean to 10.1" do
    Gauss::Distribution.new(10.1, 0.4).mean.should == 10.1
  end
  
  it "should set the deviation to 0.4" do
    Gauss::Distribution.new(10.1, 0.4).deviation.should == 0.4
  end
  
  it "should set the mean to 0.0 if the given mean is not finite" do
    Gauss::Distribution.new(1 / 0.0, 0.4).mean.should == 0.0
  end
  
  it "should set the deviation to 0.0 if the given deviation is not finite" do
    Gauss::Distribution.new(10.1, 1 / 0.0).deviation.should == 0.0
  end
  
end

describe Gauss::Distribution, "#with_deviation" do
  
  before :each do 
    @dist = Gauss::Distribution.with_deviation(25.0, 8.333333)
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
  
describe Gauss::Distribution, "#with_precision" do
  
  before :each do 
    @dist = Gauss::Distribution.with_precision(0.36, 0.0144)
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

describe Gauss::Distribution, "absolute difference (-)" do
  
  before :each do 
    @dist = Gauss::Distribution.with_deviation(25.0, 8.333333)
  end
  
  it "should be 0.0 for the same distribution" do
    (@dist - @dist).should == 0.0
  end
  
  it "should equal the precision mean if the 0-distribution is subtracted" do
    (@dist - Gauss::Distribution.new).should == @dist.precision_mean
  end
  
  it "should be 130.399408 for (22, 0.4) - (12, 1.3)" do
    (Gauss::Distribution.new(22, 0.4) - Gauss::Distribution.new(12, 1.3)).should be_close(130.399408, tolerance)
  end
  
end

describe Gauss::Distribution, "#value_at" do
  
  it "should have a value of 0.073654 for x = 2" do
    Gauss::Distribution.new(4,5).value_at(2).should be_close(0.073654, tolerance)
  end
  
end

describe Gauss::Distribution, "multiplication (*)" do
  
  it "should have a mean of 0.2" do
    (Gauss::Distribution.new(0,1) * Gauss::Distribution.new(2,3)).mean.should be_close(0.2, 0.00001)
  end
  
  it "should have a deviation of 3.0 / Math.sqrt(10)" do
    (Gauss::Distribution.new(0,1) * Gauss::Distribution.new(2,3)).deviation.should be_close(3.0 / Math.sqrt(10), 0.00001)
  end
  
end

describe Gauss::Distribution, "#log_product_normalization" do
  
  it "should have calculate -3.0979981" do
    lp = Gauss::Distribution.log_product_normalization(Gauss::Distribution.new(4,5), Gauss::Distribution.new(6,7))
    lp.should be_close(-3.0979981, 0.000001)
  end
  
end

describe Gauss::Distribution, "functions" do
  
  describe 'value = 0.27' do
    
    it "#cumulative_distribution_function should return 0.6064198" do
      Gauss::Distribution.cumulative_distribution_function(0.27).should be_close(0.6064198, 0.00001)
      Gauss::Distribution.cdf(2.0).should be_close(0.9772498, 0.00001)
    end
    
    it "#probability_density_function should return 0.384662" do
      Gauss::Distribution.probability_density_function(0.27).should be_close(0.384662, 0.0001)
    end
    
    it "#quantile_function should return -0.62941" do
      Gauss::Distribution.quantile_function(0.27).should be_close(-0.62941, 0.00001)
    end
    
  end
  
end

describe Gauss::Distribution, "#replace" do
  
  before :each do 
    @dist1 = Gauss::Distribution.with_deviation(25.0, 8.333333)
    @dist2 = Gauss::Distribution.with_deviation(9.0, 4)
  end
  
  it "should be equal to the replaced distribution" do
    @dist1.replace(@dist2)
    @dist1.should == @dist2
  end
  
end
