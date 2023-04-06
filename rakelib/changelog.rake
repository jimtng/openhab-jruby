# frozen_string_literal: true

require "github_changelog_generator/task"
require "openhab/dsl/version"

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.header = "# JRuby openHAB Scripting Change Log"
  config.user = "openhab"
  config.project = "openhab-jruby"
  config.since_tag = "v5.0.0"
  config.future_release = "v#{OpenHAB::DSL::VERSION}"
  config.bug_prefix = "### Bug Fixes"
  config.enhancement_prefix = "### Features"
  config.issues = true
  config.add_pr_wo_labels = false
  config.add_issues_wo_labels = false
  config.exclude_labels = ["documentation"]
end
