module TrueSkillMatchers
  
  class EqualRating
    
    def initialize(mean, deviation, precision)
      @expected = TrueSkill::Rating.new(mean, deviation)
      @precision = 10**precision
    end
    
    def matches?(target)
      @target = target
      @mean_diff = @expected.mean - @target.mean
      @deviation_diff = @expected.deviation - @target.deviation
      (@mean_diff*@precision).to_i + (@deviation_diff*@precision).to_i == 0
    end
    
    def failure_message
      "expected rating #{@target.to_s} to be equal to #{@expected.to_s} #{failure_info}"
    end
    
    def negative_failure_message
      "expected rating #{@target.to_s} not to be equal to #{@expected.to_s} #{failure_info}"
    end
    
    def failure_info
      msg = []
      msg << "mean differs by #{@mean_diff}" if @mean_diff != 0.0
      msg << "deviation differs by #{@deviation_diff}" if @deviation_diff != 0.0
      " (#{msg.join(', ')})"
    end
    
  end
  
  def eql_rating(target_mean, target_deviation, precision = 5)
    EqualRating.new(target_mean, target_deviation, precision)
  end
  
end
