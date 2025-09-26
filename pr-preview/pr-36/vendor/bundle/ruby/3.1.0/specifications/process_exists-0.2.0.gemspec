# -*- encoding: utf-8 -*-
# stub: process_exists 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "process_exists".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["wilsonsilva".freeze]
  s.date = "2018-05-22"
  s.description = "Sends a null signal to a process or a group of processes specified by pid to check if it exists.".freeze
  s.email = "me@wilsonsilva.net".freeze
  s.homepage = "https://github.com/wilsonsilva/process_exists".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Checks if a PID exists.".freeze

  s.installed_by_version = "3.3.26" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.16"])
    s.add_development_dependency(%q<simplecov-console>.freeze, ["~> 0.4"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.9"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.16"])
    s.add_dependency(%q<simplecov-console>.freeze, ["~> 0.4"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9"])
  end
end
