require 'rubygems'
require 'rake'
require 'bundler'

Bundler.setup
Bundler.require

require 'spec/rake/spectask'

desc 'Default: run specs.'
task :default => :spec

desc 'Run the specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.rcov_opts  << '--exclude "gems/*,spec/*"'
  t.rcov       = true
  t.rcov_dir   = 'doc/coverage'
  t.spec_files = FileList['spec/**/*_spec.rb']
end

YARD::Rake::YardocTask.new(:doc) do |t|
  t.files   = ['lib/**/*.rb', 'HISTORY.md']
  t.options = ['--no-private', '--title', 'trueskill Documentation', '--readme', 'README.md']
end
