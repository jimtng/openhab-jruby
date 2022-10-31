# frozen_string_literal: true

require_relative "generic_item"

module OpenHAB
  module Core
    module Items
      java_import org.openhab.core.library.items.LocationItem

      # Adds methods to core OpenHAB NumberItem type to make it more natural in
      # Ruby
      class LocationItem < GenericItem
        # Support conversion to location items from a hash
        # @!visibility private
        def format_type(command)
          return PointType.new(command.to_hash) if command.respond_to?(:to_hash)

          super
        end
      end
    end
  end
end