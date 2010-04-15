module Saulabs
  module TrueSkill
    
    class Rating < Gauss::Distribution
      
      attr_reader :activity, :tau, :tau_squared
      
      def initialize(mean, deviation, activity = 1.0, tau = 25/300.0)
        super(mean, deviation)
        @activity = activity
        @tau = tau
        @tau_squared = @tau**2
      end
      
    end
    
  end
end