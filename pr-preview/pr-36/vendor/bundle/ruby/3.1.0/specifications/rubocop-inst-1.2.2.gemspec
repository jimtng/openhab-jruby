# -*- encoding: utf-8 -*-
# stub: rubocop-inst 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-inst".freeze
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/instructure/rubocop-inst", "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Cody Cutrer".freeze]
  s.date = "2025-03-20"
  s.description = "Shared Rubocop configuration for all Instructure Ruby projects".freeze
  s.email = ["cody@instructure.com".freeze]
  s.homepage = "https://github.com/instructure/rubocop-inst".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Rubocop Config for Instructure".freeze

  s.installed_by_version = "3.3.26" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rubocop>.freeze, ["~> 1.72", ">= 1.72.1"])
    s.add_runtime_dependency(%q<rubocop-performance>.freeze, ["~> 1.24"])
  else
    s.add_dependency(%q<rubocop>.freeze, ["~> 1.72", ">= 1.72.1"])
    s.add_dependency(%q<rubocop-performance>.freeze, ["~> 1.24"])
  end
end
