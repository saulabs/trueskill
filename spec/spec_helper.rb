require 'rubygems'
require 'spec'
require 'spec/autorun'
require "#{File.dirname(__FILE__)}/../lib/saulabs/trueskill.rb"

include Saulabs

Spec::Runner.configure do |config|
  
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
