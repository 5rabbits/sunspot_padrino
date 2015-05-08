# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sunspot_padrino"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jordan Yaker", "Supportify, Inc."]
  s.date = "2015-05-08"
  s.description = "    Sunspot::Padrino is a derived plugin that provides drop-in integration of the\n    Sunspot Solr search library with Padrino. It is based on the original Sunspot\n    ::Rails library located at https://github.com/sunspot/sunspot.\n"
  s.email = "help@supportify.io"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "generators/sunspot.rb",
    "generators/templates/sunspot.yml",
    "lib/sunspot/padrino.rb",
    "lib/sunspot/padrino/adapters.rb",
    "lib/sunspot/padrino/cli/tasks.rb",
    "lib/sunspot/padrino/configuration.rb",
    "lib/sunspot/padrino/init.rb",
    "lib/sunspot/padrino/rspec/spec_helper.rb",
    "lib/sunspot/padrino/searchable.rb",
    "lib/sunspot/padrino/server.rb",
    "lib/sunspot/padrino/stub_session_proxy.rb",
    "lib/sunspot_padrino.rb",
    "spec/spec_helper.rb",
    "spec/sunspot_padrino_spec.rb",
    "sunspot_padrino.gemspec"
  ]
  s.homepage = "http://github.com/supportify/sunspot_padrino"
  s.licenses = ["BSD"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.6"
  s.summary = "Padrino integration for the Sunspot Solr search library"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

