# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "sunspot_padrino"
  gem.homepage = "http://github.com/supportify/sunspot_padrino"
  gem.license = "BSD"
  gem.summary = %Q{Padrino integration for the Sunspot Solr search library}
  gem.description = <<-TEXT
    Sunspot::Padrino is a derived plugin that provides drop-in integration of the
    Sunspot Solr search library with Padrino. It is based on the original Sunspot
    ::Rails library located at https://github.com/sunspot/sunspot.
  TEXT
  gem.email = "help@supportify.io"
  gem.authors = ["Jordan Yaker", "Supportify, Inc."]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "sunspot_padrino #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
