require File.dirname(__FILE__) + '/../spec_helper'

describe "Game" do
  
  before :each do 
   @game = TrueSkill::Game.new
  end
  
  it "should respond to result" do
    @game.result.should be_nil
  end
  
end
