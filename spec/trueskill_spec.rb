require File.dirname(__FILE__) + '/../spec_helper'

describe "TrueSkill" do
  
  describe 'update for a single game' end
  
    before :each do 
     @player1 = TrueSkill::Player.new
     @player2 = TrueSkill::Player.new
     @game = TrueSkill::Game.new([[@player1], [@player2]], [1,0])
    end
  
    it "should" do
      TrueSkill.update(@game)
      
    end
  
  end
  
end
