module TrueSkill
  
  class Player
    
    # mean value of the players rating
    attr_accessor :rating
    
    # standard deviation of the players rating
    attr_accessor :deviation
    
    def initialize(rating = 25.0, deviation = 8.333333)
      @rating = rating
      @deviation = deviation
    end
  end

end