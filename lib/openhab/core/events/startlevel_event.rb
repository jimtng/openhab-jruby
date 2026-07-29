# frozen_string_literal: true

module OpenHAB
  module Core
    module Events
      java_import org.openhab.core.events.system.StartlevelEvent

      #
      # The {AbstractEvent} sent when the system start level changed.
      #
      class StartlevelEvent < AbstractEvent
        #
        # The new start level.
        #
        # @return [StartLevel] The new start level.
        #
        def startlevel
          StartLevel.new(super)
        end
      end
    end
  end
end
