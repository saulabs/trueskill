puts "loaded #{__FILE__}"

module TrueSkill

  class Game
    
    # array of players
    attr_accessor :teams
    
    # result of the game coded as array
    # example: [0,1] team at index 1 won
    attr_accessor :result
    
    def initialize(teams = [], result = [])
      @teams = teams
      @result = result
    end
    
  end
  
end