# -*- encoding: utf-8 -*-
# stub: cuke_linter 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "cuke_linter".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/enkessler/cuke_linter/issues", "changelog_uri" => "https://github.com/enkessler/cuke_linter/blob/master/CHANGELOG.md", "documentation_uri" => "https://www.rubydoc.info/gems/cuke_linter", "homepage_uri" => "https://github.com/enkessler/cuke_linter", "source_code_uri" => "https://github.com/enkessler/cuke_linter" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Eric Kessler".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-05-23"
  s.description = "This gem provides linters for detecting common 'smells' in `.feature` files. In addition to the provided linters, custom linters can be made in order to create custom linting rules.".freeze
  s.email = ["morrow748@gmail.com".freeze]
  s.executables = ["cuke_linter".freeze]
  s.files = ["exe/cuke_linter".freeze]
  s.homepage = "https://github.com/enkessler/cuke_linter".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 2.1".freeze, "< 4.0".freeze])
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Lints feature files used by Cucumber and other similar frameworks.".freeze

  s.installed_by_version = "3.3.26" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<cuke_modeler>.freeze, [">= 1.5", "< 4.0"])
    s.add_development_dependency(%q<bundler>.freeze, ["< 3.0"])
    s.add_development_dependency(%q<childprocess>.freeze, ["< 4.0"])
    s.add_development_dependency(%q<cucumber>.freeze, ["< 5.0"])
    s.add_development_dependency(%q<cuke_slicer>.freeze, [">= 2.0.2", "< 3.0"])
    s.add_development_dependency(%q<ffi>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<parallel>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<rainbow>.freeze, ["< 4.0.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_development_dependency(%q<require_all>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["<= 0.57.2"])
    s.add_development_dependency(%q<simplecov>.freeze, ["< 1.0"])
    s.add_development_dependency(%q<simplecov-lcov>.freeze, ["< 1.0"])
    s.add_development_dependency(%q<yard>.freeze, ["< 1.0"])
  else
    s.add_dependency(%q<cuke_modeler>.freeze, [">= 1.5", "< 4.0"])
    s.add_dependency(%q<bundler>.freeze, ["< 3.0"])
    s.add_dependency(%q<childprocess>.freeze, ["< 4.0"])
    s.add_dependency(%q<cucumber>.freeze, ["< 5.0"])
    s.add_dependency(%q<cuke_slicer>.freeze, [">= 2.0.2", "< 3.0"])
    s.add_dependency(%q<ffi>.freeze, ["~> 1.0"])
    s.add_dependency(%q<parallel>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rainbow>.freeze, ["< 4.0.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<require_all>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rubocop>.freeze, ["<= 0.57.2"])
    s.add_dependency(%q<simplecov>.freeze, ["< 1.0"])
    s.add_dependency(%q<simplecov-lcov>.freeze, ["< 1.0"])
    s.add_dependency(%q<yard>.freeze, ["< 1.0"])
  end
end
