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
          dist.mean = mean
          dist.deviation = deviation
          dist.variance = deviation * deviation
          dist.precision = 1 / dist.variance.to_f
          dist.precision_mean = dist.precision * mean
          return dist
        end
  
        def with_precision(mean, precision)
          Distribution.with_deviation(mean / precision, Math.sqrt(1 / precision))
        end
      
        def absolute_difference(x, y)
          [(x.precision_mean - y.precision_mean).abs, Math.sqrt((x.precision - y.precision).abs)].max
        end
      
        def log_product_normalisation(x, y)
          return 0.0 if x.precision == 0.0 || y.precision == 0.0
          vsum = x.variance + y.variance
          mdiff = x.mean - y.mean
          -0.91893853320467267 - Math.log(vsum) / 2.0 - mdiff * mdiff / 2.0 * vsum
        end
      
        def log_ratio_normalisation(x, y)
          return 0.0 if x.precision == 0.0 || y.precision == 0.0
          v2 = y.variance
          vdiff = v2 - x.variance
          return 0.0 if vdiff == 0.0
          mdiff = x.mean - y.mean
          Math.log(v2) + 0.91893853320467267 - Math.log(vdiff) / 2.0 + mdiff * mdiff / 2.0 * vdiff
        end
      
      end
  
      def *(other)
        Rating.with_precision(self.precision_mean + other.precision_mean, self.precision + other.precision)
      end
  
      def /(other)
        Rating.with_precision(self.precision_mean - other.precision_mean, self.precision - other.precision)
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
  
    end
  end
end