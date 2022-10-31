# frozen_string_literal: true

Dir[File.expand_path("core/**/*.rb", __dir__)].sort.each do |f|
  require f
end

module OpenHAB
  # Contains classes and modules that wrap actual OpenHAB objects
  module Core
    # @return [Integer] Number of seconds to wait between checks for automation manager
    CHECK_DELAY = 10
    private_constant :CHECK_DELAY
    class << self
      #
      # Wait until OpenHAB engine ready to process
      #
      # @return [void]
      #
      # @!visibility private
      def wait_till_openhab_ready
        logger.trace("Checking readiness of OpenHAB")
        until automation_manager
          logger.trace("Automation manager not loaded, checking again in #{CHECK_DELAY} seconds.")
          sleep CHECK_DELAY
        end
        logger.trace "Automation manager instantiated, OpenHAB ready for rule processing."
      end

      #
      # @!attribute [r] config_folder
      # @return [String] The configuration folder path name.
      #
      def config_folder
        org.openhab.core.OpenHAB.config_folder
      end

      #
      # JRuby isn't respecting $RUBYLIB when run embedded inside of OpenHAB, so do it manually
      #
      # @return [void]
      #
      # @!visibility private
      def add_rubylib_to_load_path
        ENV["RUBYLIB"]&.split(File::PATH_SEPARATOR)&.each do |path|
          next if path.empty?

          $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
        end
      end

      #
      # @!attribute [r] automation_manager
      # @return [org.openhab.core.automation.rule.script.rulesupport.shared.ScriptedAutomationManager]
      #   The OpenHAB Automation manager.
      #
      def automation_manager
        $scriptExtension.get("automationManager")
      end

      #
      # @!attribute [r] rule_registry
      # @return [org.openhab.core.automation.RuleRegistry] The OpenHAB rule registry
      #
      def rule_registry
        $scriptExtension.get("ruleRegistry")
      end
    end
  end
end