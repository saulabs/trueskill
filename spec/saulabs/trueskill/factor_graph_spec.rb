# -*- encoding : utf-8 -*-
require File.expand_path('spec/spec_helper.rb')

describe Saulabs::TrueSkill::FactorGraph do

  before :each do
    @teams = create_teams
    @skill = @teams[0][0]
    @results = { @team1 => 1, @team2 => 2, @team3 => 3 }
    @graph = TrueSkill::FactorGraph.new(@results)
  end

  describe "#update_skills" do

    it "should update the mean of the first player in team1 to 30.38345" do
      @graph.update_skills
      @skill.mean.should be_within(tolerance).of(30.38345)
    end

    it "should update the deviation of the first player in team1 to 3.46421" do
      @graph.update_skills
      @skill.deviation.should be_within(tolerance).of(3.46421)
    end

  end

  describe "#draw_margin" do

    it "should be -0.998291 for diff 0.740466" do
      @graph.draw_margin.should be_within(tolerance).of(0.740466)
    end

  end


  context "When there are two teams" do
    let :team1 do
      [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    end

    let :team2 do
      [TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)]
    end

    let :teams do
      [team1,team2]
    end

    let :results do
      { team1 => 1, team2 => 2 }
    end

    let(:draw_results) do
      { team1 => 1, team2 => 1 }
    end
    context "and exactly two players" do

      describe 'team1 win with standard rating' do

        before :each do
          TrueSkill::FactorGraph.new(results).update_skills
        end

        it "should change first players rating to [29.395832, 7.1714755]" do
          teams[0][0].should eql_rating(29.395832, 7.1714755)
        end

        it "should change second players rating to [20.6041679, 7.1714755]" do
          teams[1][0].should eql_rating(20.6041679, 7.1714755)
        end

      end
    end

    describe 'draw with standard rating' do

      before :each do
        TrueSkill::FactorGraph.new(draw_results).update_skills
      end

      it "should change first players rating to [25.0, 6.4575196]" do
        teams[0][0].should eql_rating(25.0, 6.4575196)
      end

      it "should change second players rating to [25.0, 6.4575196]" do
        teams[1][0].should eql_rating(25.0, 6.4575196)
      end

    end

    describe 'draw with different ratings' do
      let :team2 do
        [TrueSkill::Rating.new(50.0, 12.5, 1.0, 25.0/300.0)]
      end

      before :each do
        TrueSkill::FactorGraph.new(draw_results).update_skills
      end

      it "should change first players rating to [31.6623, 7.1374]" do
        teams[0][0].should eql_rating(31.662301, 7.1374459)
      end

      it "should change second players mean to [35.0107, 7.9101]" do
        teams[1][0].should eql_rating(35.010653, 7.910077)
      end

    end


    context "when it is a 1 vs 2" do
      let :team2 do
        [
          TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0),
          TrueSkill::Rating.new(25.0, 25.0/3.0, 1.0, 25.0/300.0)
        ]
      end

      context "and the skills are additive" do
        describe "#@skill_update" do
          it "should have a Boolean @skills_additive = false" do
            @graph = TrueSkill::FactorGraph.new(draw_results, {:skills_additive => false})
            @graph.skills_additive.should be_false
          end

          it "should update the mean of the first player in team1 to 25.0 after draw" do
            @graph = TrueSkill::FactorGraph.new(draw_results, {:skills_additive => false})

            @graph.update_skills
            teams[0][0].mean.should be_within(tolerance).of(25.0)
          end
        end
      end
    end
  end
end
