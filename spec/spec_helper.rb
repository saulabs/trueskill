require 'rubygems'
require 'spec'
require 'spec/autorun'
require "#{File.dirname(__FILE__)}/../lib/saulabs/trueskill.rb"

include Saulabs

Spec::Runner.configure do |config|
  
end

def create_teams
  [
    [
      Gauss::Distribution.with_deviation(25, 25/3.0)
    ],
    [
      Gauss::Distribution.with_deviation(25, 25/3.0),
      Gauss::Distribution.with_deviation(25, 25/3.0)
    ],
    [
      Gauss::Distribution.with_deviation(25, 25/3.0)
    ]
  ]
end
