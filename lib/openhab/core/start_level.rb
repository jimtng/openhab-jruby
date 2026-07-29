# frozen_string_literal: true

module OpenHAB
  module Core
    # Represents the current start level of the openHAB runtime.
    #
    # Acts as a Value Object that can be compared against both Integers and Symbols,
    # and supports standard numeric operations and range checks.
    #
    # @example Compare with Symbols
    #   if OpenHAB::Core.startlevel >= :ui
    #     logger.info "UI is online!"
    #   end
    #
    # @example Compare with Integers
    #   if OpenHAB::Core.startlevel >= 80
    #     logger.info "Things initialized"
    #   end
    #
    class StartLevel
      include Comparable

      # Map of start level symbols to their integer values.
      MAPPING = begin
        klass = org.openhab.core.service.StartLevelService.java_class
        klass.declared_fields
             .select { |f| f.type.name == "int" && f.name.start_with?("STARTLEVEL_") }
             .each_with_object({}) do |field, hash|
               sym = field.name.sub("STARTLEVEL_", "").downcase.to_sym
               hash[sym] = field.get_int(klass)
             end
      end.freeze

      REVERSE_MAPPING = MAPPING.invert.freeze

      private_constant :MAPPING, :REVERSE_MAPPING

      # @return [Integer] The raw integer start level value.
      attr_reader :to_i
      alias_method :to_int, :to_i

      # Helper method to resolve Integers, Symbols, or StartLevel instances to an Integer.
      #
      # @param val [Integer, Symbol, StartLevel]
      # @return [Integer, nil]
      def self.coerce_to_int(val)
        case val
        when Integer then val
        when Symbol then MAPPING[val]
        when StartLevel then val.to_i
        end
      end

      # Create a new StartLevel instance.
      #
      # @param level [Integer, Symbol, StartLevel] The start level value or symbol.
      # @raise [ArgumentError] If the level cannot be coerced to a valid integer.
      def initialize(level)
        @to_i = self.class.coerce_to_int(level)
        raise ArgumentError, "Invalid start level or symbol: #{level.inspect}" unless @to_i
      end

      # Returns the symbol representation of the start level, if one exists.
      #
      # @return [Symbol, nil]
      def to_sym
        REVERSE_MAPPING[@to_i]
      end

      # Compares this start level with another (Integer, Symbol, or StartLevel).
      #
      # @param other [Integer, Symbol, StartLevel]
      # @return [Integer, nil] -1, 0, 1, or nil if not comparable.
      def <=>(other)
        other_int = self.class.coerce_to_int(other)
        return nil unless other_int

        @to_i <=> other_int
      end

      # Check equality against Integers, Symbols, or StartLevel instances.
      #
      # @param other [Object]
      # @return [Boolean]
      def ==(other)
        if other.is_a?(Symbol)
          to_sym == other || @to_i == MAPPING[other]
        else
          other_int = self.class.coerce_to_int(other)
          return false unless other_int

          @to_i == other_int
        end
      end

      # Enables symmetric math operations with integers (e.g. `100 - start_level`).
      #
      # @param other [Numeric]
      # @return [Array(Numeric, Integer)]
      def coerce(other)
        [other, @to_i]
      end

      # String representation of the start level.
      #
      # @return [String]
      def to_s
        to_sym ? "#{to_sym} (#{@to_i})" : @to_i.to_s
      end

      # Inspect string for logging and debug output.
      #
      # @return [String]
      def inspect
        to_sym ? ":#{to_sym} (#{@to_i})" : @to_i.to_s
      end
    end
  end
end
