# -*- encoding : utf-8 -*-
require File.expand_path('spec/spec_helper.rb')

describe TrueSkill::Layers::PriorToSkills do

  before :each do
    @teams = create_teams
    @results = {@team1 => 1, @team2 => 2, @team3 => 3}
    @graph = TrueSkill::FactorGraph.new(@results)
    @layer = TrueSkill::Layers::PriorToSkills.new(@graph, @teams)
  end

  describe "#build" do

    it "should add 4 factors" do
      lambda {
        @layer.build
      }.should change(@layer.factors, :size).by(4)
    end

    it "should add 3 output variables" do
      lambda {
        @layer.build
      }.should change(@layer.output, :size).by(3)
    end

  end

  describe "#prior_schedule" do

    before :each do
      @layer.build
    end

    it "should return a sequence-schedule" do
      @layer.prior_schedule.should be_kind_of(TrueSkill::Schedules::Sequence)
    end

  end

end
