require File.dirname(__FILE__) + '/../../spec_helper'

describe Gauss::TruncatedCorrection do

  describe "#w_within_margin" do

    it "should return 0.970397 for (0.2, 0.3)" do
      Gauss::TruncatedCorrection.w_within_margin(0.2, 0.3).should be_close(0.970397, tolerance)
      Gauss::TruncatedCorrection.w_within_margin(0.1, 0.03).should be_close(0.9997, tolerance)
    end

  end

  describe "#v_within_margin" do

    it "should return -0.194073 for (0.2, 0.3)" do
      Gauss::TruncatedCorrection.v_within_margin(0.2, 0.3).should be_close(-0.194073, tolerance)
      Gauss::TruncatedCorrection.v_within_margin(0.1, 0.03).should be_close(-0.09997, tolerance)
    end

  end
  
  describe "#w_exceeds_margin" do
  
    it "should return 0.657847 for (0.2, 0.3)" do
      Gauss::TruncatedCorrection.w_exceeds_margin(0.2, 0.3).should be_close(0.657847, tolerance)
      Gauss::TruncatedCorrection.w_exceeds_margin(0.1, 0.03).should be_close(0.621078, tolerance)
    end
  
  end
  
  describe "#v_exceeds_margin" do
  
    it "should return 0.8626174 for (0.2, 0.3)" do
      Gauss::TruncatedCorrection.v_exceeds_margin(0.2, 0.3).should be_close(0.8626174, tolerance)
      Gauss::TruncatedCorrection.v_exceeds_margin(0.1, 0.03).should be_close(0.753861, tolerance)
    end
  
  end

end
