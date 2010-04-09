require File.dirname(__FILE__) + '/../spec_helper'

describe "Player" do
  
  before :each do 
   @player = TrueSkill::Player.new
  end
  
  it "should have a default rating of 25.0" do
    @player.rating.should == 25.0
  end
  
  it "should have a default deviation of 8.333333" do
    @player.deviation.should == 8.333333
  end
  
end
