module Saulabs
  module Gauss
    
    # Implementation of a gaussian distribution
    # 
    class Distribution
      
      @@sqrt2 = Math.sqrt(2).freeze
      @@inv_sqrt_2pi = (1 / Math.sqrt(2 * Math::PI)).freeze
      @@log_sqrt_2pi = Math.log(Math.sqrt(2 * Math::PI)).freeze
    
      # gaussian normal distribution values
      attr_accessor :mean, :deviation, :variance, :precision, :precision_mean
      
      def initialize(mean = 0.0, deviation = 0.0)
        mean = 0.0 unless mean.to_f.finite?
        deviation = 0.0 unless deviation.to_f.finite?
        @mean = mean
        @deviation = deviation
        @variance = deviation * deviation
        @precision = deviation == 0.0 ? 0.0 : 1 / @variance.to_f
        @precision_mean = @precision * mean
      end
    
      class << self
        
        def standard
          Distribution.new(0.0, 1.0)
        end
      
        def with_deviation(mean, deviation)
          Distribution.new(mean, deviation)
        end
        
        def with_variance(mean, variance)
          Distribution.new(mean, Math.sqrt(variance))
        end
  
        def with_precision(mean, precision)
          Distribution.new(mean / precision, Math.sqrt(1 / precision))
        end
      
        def absolute_difference(x, y)
          [(x.precision_mean - y.precision_mean).abs, Math.sqrt((x.precision - y.precision).abs)].max
        end
      
        def log_product_normalization(x, y)
          return 0.0 if x.precision == 0.0 || y.precision == 0.0
          variance_sum = x.variance + y.variance
          mean_diff = x.mean - y.mean
          -@@log_sqrt_2pi - (Math.log(variance_sum) / 2.0) - (mean_diff**2 / (2.0 * variance_sum))
        end
      
        def log_ratio_normalization(x, y)
          return 0.0 if x.precision == 0.0 || y.precision == 0.0
          variance_diff = y.variance - x.variance
          return 0.0 if variance_diff == 0.0
          mean_diff = x.mean - y.mean
          Math.log(y.variance) + @@log_sqrt_2pi - (Math.log(variance_diff) / 2.0) + (mean_diff**2 / (2.0 * variance_diff))
        end
        
        # Computes the cummulative Gaussian distribution at a specified point of interest
        def cumulative_distribution_function(x)
          0.5 * (1 + Math.erf(x / @@sqrt2))
        end
        alias_method :cdf, :cumulative_distribution_function
        
        # Computes the Gaussian density at a specified point of interest
        def probability_density_function(x)
          @@inv_sqrt_2pi * Math.exp(-0.5 * (x**2))
        end
        alias_method :pdf, :probability_density_function
        
        # The inverse of the cummulative Gaussian distribution function
        def quantile_function(x)
          -@@sqrt2 * Math.erfc(2.0 * x)
        end
        alias_method :inv_cdf, :quantile_function
        
      end
      
      def value_at(x)
        exp = -(x - @mean)**2.0 / (2.0 * @variance)
        (1.0/@deviation) * @@inv_sqrt_2pi * Math.exp(exp)
      end
      
      # copy values from other distribution
      def replace(other)
        @precision = other.precision
        @precision_mean = other.precision_mean
        @mean = other.mean
        @deviation = other.deviation
        @variance = other.variance
      end
  
      def *(other)
        Distribution.with_precision(self.precision_mean + other.precision_mean, self.precision + other.precision)
      end
  
      def /(other)
        Distribution.with_precision(self.precision_mean - other.precision_mean, self.precision - other.precision)
      end
  
      # absolute difference
      def -(other)
        Distribution.absolute_difference(self, other)
      end
    
      def +(other)
      
      end
    
      def ==(other)
        self.mean == other.mean && self.variance == other.variance
      end
  
      def equals(other)
        self == other
      end
      
      def to_s
        "[μ=#{'%.4f' % mean}, σ=#{'%.4f' % deviation}]"
      end
  
    end
  end
end
