# -*- encoding : utf-8 -*-
Dir.glob("#{File.dirname(__FILE__)}/gauss/**/*.rb").each do |src|
  require src
end
