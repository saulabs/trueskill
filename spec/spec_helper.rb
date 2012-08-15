# -*- encoding : utf-8 -*-
require 'rubygems'
require 'rspec'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", "saulabs", "trueskill.rb"))
require File.expand_path(File.join(File.dirname(__FILE__), "true_skill_matchers.rb"))

include Saulabs

Spec::Runner.configure do |config|
  config.include(TrueSkillMatchers)
end

def tolerance
  0.001
end

def create_teams
  [
    [
      TrueSkill::Rating.new(25, 4.1)
    ],
    [
      TrueSkill::Rating.new(27, 3.1),
      TrueSkill::Rating.new(10, 1.0)
    ],
    [
      TrueSkill::Rating.new(32, 0.2)
    ]
  ]
end
