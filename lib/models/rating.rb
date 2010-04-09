module TrueSkill
  
  class Rating
    
    # gaussian normal distribution values
    attr_accessor :mean, :deviation, :variance, :precision, :precision_mean
    
    # how active was the player in the game
    # valid values: [0.0, 1.0]
    attr_accessor :activity
    
    def self.with_deviation(mean, deviation)
      rating = Rating.new
      rating.mean = mean
      rating.deviation = deviation
      rating.variance = deviation * deviation
      rating.precision = 1 / rating.variance.to_f
      rating.precision_mean = rating.precision * mean
      return rating
    end
    
    def self.with_precision(mean, precision)
      rating = Rating.new
      rating.precision = precision
      rating.precision_mean = mean
      rating.variance = 1 / precision
      rating.deviation = Math.sqrt(rating.variance)
      rating.mean = mean / precision
      return rating
    end
    
    def *(other)
      
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