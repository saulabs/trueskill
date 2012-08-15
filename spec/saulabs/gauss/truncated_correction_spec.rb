# -*- encoding : utf-8 -*-
require File.expand_path('spec/spec_helper.rb')

describe Gauss::TruncatedCorrection do

  describe "#w_within_margin" do

    it "should return 0.970397 for (0.2, 0.3)" do
      Gauss::TruncatedCorrection.w_within_margin(0.2, 0.3).should be_within(tolerance).of(0.970397)
      Gauss::TruncatedCorrection.w_within_margin(0.1, 0.03).should be_within(tolerance).of(0.9997)
    end

  end

  describe "#v_within_margin" do

    it "should return -0.194073 for (0.2, 0.3)" do
      Gauss::TruncatedCorrection.v_within_margin(0.2, 0.3).should be_within(tolerance).of(-0.194073)
      Gauss::TruncatedCorrection.v_within_margin(0.1, 0.03).should be_within(tolerance).of(-0.09997)
    end

  end
  
  describe "#w_exceeds_margin" do
  
    it "should return 0.657847 for (0.2, 0.3)" do
      Gauss::TruncatedCorrection.w_exceeds_margin(0.0, 0.740466).should be_within(tolerance).of(0.76774506)
      Gauss::TruncatedCorrection.w_exceeds_margin(0.2, 0.3).should be_within(tolerance).of(0.657847)
      Gauss::TruncatedCorrection.w_exceeds_margin(0.1, 0.03).should be_within(tolerance).of(0.621078)
    end
  
  end
  
  describe "#v_exceeds_margin" do
  
    it "should return 0.8626174 for (0.2, 0.3)" do
      Gauss::TruncatedCorrection.v_exceeds_margin(0.0, 0.740466).should be_within(tolerance).of(1.32145197)
      Gauss::TruncatedCorrection.v_exceeds_margin(0.2, 0.3).should be_within(tolerance).of(0.8626174)
      Gauss::TruncatedCorrection.v_exceeds_margin(0.1, 0.03).should be_within(tolerance).of(0.753861)
    end
  
  end

end
