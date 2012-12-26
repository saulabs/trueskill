# -*- encoding : utf-8 -*-
require File.expand_path('spec/spec_helper.rb')





describe "Saulabs::TrueSkill::ScoreBasedBayesianRating: 2 vs 2: team 1=> 1.0, team2 => -1.0" do


  before :each do
    @team1 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @team2 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @teams = [@team1,@team2]
    @skill = @teams[0][0]
    @results = { @team1 => 1.0, @team2 => -1.0 }
    @graph = TrueSkill::FactorGraph.new(@results)
  end

  describe "#update_skills " do

    it "should update the mean of the first player in team1: " do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
  describe "#update_skills " do

    it "should update the mean of the first player in team1: skills additive => false" do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10, :skills_additive => false})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
end

describe "Saulabs::TrueSkill::ScoreBasedBayesianRating: 2 vs 2: team 1=> -1.0, team2 => 1.0" do


  before :each do
    @team1 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @team2 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @teams = [@team1,@team2]
    @skill = @teams[0][0]
    @results = { @team1 => -1.0, @team2 => 1.0 }
    @graph = TrueSkill::FactorGraph.new(@results)
  end

  describe "#update_skills " do

    it "should update the mean of the first player in team1: " do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
  describe "#update_skills " do

    it "should update the mean of the first player in team1: skills additive => false" do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10, :skills_additive => false})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
end


describe "Saulabs::TrueSkill::ScoreBasedBayesianRating: 1 vs 3: team1 => -1.0, team2 => 1.0" do


  before :each do
    @team1 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @team2 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @teams = [@team1,@team2]
    @skill = @teams[0][0]
    @results = { @team1 => -1.0, @team2 => 1.0 }
    @graph = TrueSkill::FactorGraph.new(@results)
  end

  describe "#update_skills " do

    it "should update the mean of the first player in team1: " do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
  describe "#update_skills " do

    it "should update the mean of the first player in team1: skills additive => false" do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10, :skills_additive => false})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
end

describe "Saulabs::TrueSkill::ScoreBasedBayesianRating: 1 vs 3: team1 => 1.0, team2 => -1.0" do


  before :each do
    @team1 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @team2 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @teams = [@team1,@team2]
    @skill = @teams[0][0]
    @results = { @team1 => 1.0, @team2 => -1.0 }
    @graph = TrueSkill::FactorGraph.new(@results)
  end

  describe "#update_skills " do

    it "should update the mean of the first player in team1: " do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
  describe "#update_skills " do

    it "should update the mean of the first player in team1: skills additive => false" do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10, :skills_additive => false})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
end



describe "Saulabs::TrueSkill::ScoreBasedBayesianRating: 1 vs 3: team1 => 100.0, team2 => -100.0" do


  before :each do
    @team1 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @team2 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @teams = [@team1,@team2]
    @skill = @teams[0][0]
    @results = { @team1 => 100.0, @team2 => -100.0 }
    @graph = TrueSkill::FactorGraph.new(@results)
  end

  describe "#update_skills " do

    it "should update the mean of the first player in team1: " do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
  describe "#update_skills " do

    it "should update the mean of the first player in team1: skills additive => false" do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10, :skills_additive => false})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
end

describe "Saulabs::TrueSkill::ScoreBasedBayesianRating: 1 vs 3: team1 => -100.0, team2 => 100.0" do


  before :each do
    @team1 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @team2 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @teams = [@team1,@team2]
    @skill = @teams[0][0]
    @results = { @team1 => -100.0, @team2 => 100.0 }
    @graph = TrueSkill::FactorGraph.new(@results)
  end

  describe "#update_skills " do

    it "should update the mean of the first player in team1: " do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
  describe "#update_skills " do

    it "should update the mean of the first player in team1: skills additive => false" do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10, :skills_additive => false})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
end

describe "Saulabs::TrueSkill::ScoreBasedBayesianRating: 1 vs 3: Draw: team1 => 100.0, team2 => 100.0" do


  before :each do
    @team1 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @team2 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    @teams = [@team1,@team2]
    @skill = @teams[0][0]
    @results = { @team1 => 100.0, @team2 => 100.0 }
    @graph = TrueSkill::FactorGraph.new(@results)
  end

  describe "#update_skills " do

    it "should update the mean of the first player in team1: " do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10})
      test.update_skills
      @teams[0][0].mean.should_not be_within(tolerance).of(25.0)
    end
  end
  describe "#update_skills " do

    it "should update the mean of the first player in team1: skills additive => false" do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10, :skills_additive => false})
      test.update_skills
      @teams[0][0].mean.should be_within(tolerance).of(25.0)
    end
  end
end


describe "Saulabs::TrueSkill::ScoreBasedBayesianRating: 1 vs 3: Draw: team1 => 100.0, team2 => 100.0, Test partial update" do


  before :each do
    @team1 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 0.0, 25.0/300.0)]
    @team2 = [TrueSkill::Rating.new(25.0, 25.0/3.0, 0.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 0.0, 25.0/300.0),TrueSkill::Rating.new(25.0, 25.0/3.0, 0.0, 25.0/300.0)]
    @teams = [@team1,@team2]
    @skill = @teams[0][0]
    @results = { @team1 => 100.0, @team2 => 100.0 }
    @graph = TrueSkill::FactorGraph.new(@results)
  end

  describe "#update_skills " do

    it "should update the mean of the first player in team1: " do
      test = TrueSkill::ScoreBasedBayesianRating.new(@results, {:gamma => 1, :beta => 10})
      test.update_skills
      @teams[0][0].mean.should be_within(tolerance).of(25.0)
    end
  end

end


