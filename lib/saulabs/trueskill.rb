require 'pp'

require "#{File.dirname(__FILE__)}/gauss.rb"

Dir.glob("#{File.dirname(__FILE__)}/trueskill/**/*.rb").each do |src|
  require src
end
