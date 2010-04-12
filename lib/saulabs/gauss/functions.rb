module Saulabs
  module Gauss    
    class Functions
      
      SQRT2 = Math.sqrt(2).freeze
      INV_SQRT_2PI = (1 / Math.sqrt(2 * Math::PI)).freeze
      
      class << self
        
        # Computes the cummulative Gaussian distribution at a specified point of interest
        def cumulative_distribution_function(x)
          0.5 * (1 + Math.erf(x / SQRT2))
        end
        alias_method :cdf, :cumulative_distribution_function
        
        # Computes the Gaussian density at a specified point of interest
        def probability_density_function(x)
          INV_SQRT_2PI * Math.exp(-0.5 * (x**2))
        end
        alias_method :pdf, :probability_density_function
        
        # The inverse of the cummulative Gaussian distribution function
        def quantile_function(x)
          -SQRT2 * Math.erfc(2.0 * x)
        end
        alias_method :inv_cdf, :quantile_function
        
      end
    
    end
  end
end
