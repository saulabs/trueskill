require 'rubygems'
require 'spec'
require 'spec/autorun'

Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each do |filename| 
  require filename
end

Spec::Runner.configure do |config|
  
end
