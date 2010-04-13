require File.dirname(__FILE__) + '/../../spec_helper'

describe Saulabs::Gauss::Functions do
  
  describe 'value = 0.27' do
    
    it "#cumulative_distribution_function should return 0.6064198" do
      Saulabs::Gauss::Functions.cumulative_distribution_function(0.27).should be_close(0.6064198, 0.00001)
    end
    
    it "#probability_density_function should return 0.384662" do
      Saulabs::Gauss::Functions.probability_density_function(0.27).should be_close(0.384662, 0.0001)
    end
    
    it "#quantile_function should return -0.62941" do
      Saulabs::Gauss::Functions.quantile_function(0.27).should be_close(-0.62941, 0.00001)
    end
    
  end
  
end