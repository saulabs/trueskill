module Saulabs
  module Gauss
    class Distribution
    
      # gaussian normal distribution values
      attr_accessor :mean, :deviation, :variance, :precision, :precision_mean
    
      def initialize
        @mean = 0.0
        @deviation = 0.0
        @variance = 0.0
        @precision = 0.0
        @precision_mean = 0.0
      end
    
      class << self
      
        def with_deviation(mean, deviation)
          dist = Distribution.new
          if !mean.to_f.nan? and !deviation.to_f.nan? and deviation != 0.0
            dist.mean = mean
            dist.deviation = deviation
            dist.variance = deviation * deviation
            dist.precision = 1 / dist.variance.to_f
            dist.precision_mean = dist.precision * mean
          end
          return dist
        end
        
        def with_variance(mean, variance)
          Distribution.with_deviation(mean, Math.sqrt(variance))
        end
  
        def with_precision(mean, precision)
          Distribution.with_deviation(mean / precision, Math.sqrt(1 / precision))
        end
      
        def absolute_difference(x, y)
          [(x.precision_mean - y.precision_mean).abs, Math.sqrt((x.precision - y.precision).abs)].max
        end
      
        def log_product_normalization(x, y)
          return 0.0 if x.precision == 0.0 || y.precision == 0.0
          variance_sum = x.variance + y.variance
          mean_diff = x.mean - y.mean
          -Functions::LOG_SQRT_2PI - (Math.log(variance_sum) / 2.0) - (mean_diff**2 / 2.0 * variance_sum)
        end
      
        def log_ratio_normalization(x, y)
          return 0.0 if x.precision == 0.0 || y.precision == 0.0
          variance_diff = y.variance - x.variance
          return 0.0 if variance_diff == 0.0
          mean_diff = x.mean - y.mean
          Math.log(y.variance) + Functions::LOG_SQRT_2PI - (Math.log(variance_diff) / 2.0) + (mean_diff**2 / 2.0 * variance_diff)
        end
      
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