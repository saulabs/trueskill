# Author: Lars Kuhnt
# Copyright Saulabs

module TrueSkill
  
  #
  #
  class Calculation
    
    # uncertainty of the skill’s standard deviation
    # TODO: valid values: ]0,???]
    # TODO: this should depend on the time the player did not play
    @@tau = 1.0
    
    # small beta value indicates a high-skill game (e.g. Go) since smaller 
    # differences in points lead to the 80%:20% ratio. Likewise, a game based 
    # on chance (e.g. Uno) is a low-skill game that would have a higher beta 
    # and smaller skill chain.
    # TODO: valid values: ]0,???] 
    @@beta = 10
    
    def initialize(game)
      @game = game
    end
    
    
    private
    
    # team must be an array of players with a minimum of one player
    def performance(team)
      rating = 0
      deviation = 0
      team.each do |player|
        rating += player.activity * player.rating
        deviation += player.activity * player.activity * player.deviation * player.deviation
      end
      return [rating, deviation]
    end
    
  end
  
end