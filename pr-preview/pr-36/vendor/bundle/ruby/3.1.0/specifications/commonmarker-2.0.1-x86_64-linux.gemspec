# -*- encoding: utf-8 -*-
# stub: commonmarker 2.0.1 x86_64-linux lib

Gem::Specification.new do |s|
  s.name = "commonmarker".freeze
  s.version = "2.0.1"
  s.platform = "x86_64-linux".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 3.3.22".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "funding_uri" => "https://github.com/sponsors/gjtorikian/", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/gjtorikian/commonmarker" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Garen Torikian".freeze, "Ashe Connor".freeze]
  s.bindir = "exe".freeze
  s.date = "2024-11-28"
  s.description = "A fast, safe, extensible parser for CommonMark. This wraps the comrak Rust crate.".freeze
  s.homepage = "https://github.com/gjtorikian/commonmarker".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 3.1".freeze, "< 3.4.dev".freeze])
  s.rubygems_version = "3.3.26".freeze
  s.summary = "CommonMark parser and renderer. Written in Rust, wrapped in Ruby.".freeze

  s.installed_by_version = "3.3.26" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 1.2"])
  else
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.2"])
  end
end
