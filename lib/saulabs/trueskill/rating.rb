module Saulabs
  module TrueSkill
    
    class Rating
      
      attr_accessor :skill, :activity, :tau, :tau_squared
      
      def initialize(mean, deviation, activity, inactive_since)
        @skill = Gauss::Distribution.with_deviation(mean, deviation)
        @activity = activity
        @tau = 0.1
        @tau_squared = @tau**2
      end
      
    end
    
  end
end