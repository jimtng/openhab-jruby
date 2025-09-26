# frozen_string_literal: true
module YARD
  module CLI
    # Display one object
    # @since 0.8.6
    class Display < Yardoc
      def description; 'Displays a formatted object' end

      def initialize(*args)
        super
        options.format = :text # default for this command
        @layout = nil
        @objects = []

        serializer = @options.serializer
        def serializer.serialize(_object, _data)
          # don't actually serialize anything
        end
      end

      # Runs the commandline utility, parsing arguments and displaying an object
      # from the {Registry}.
      #
      # @param [Array<String>] args the list of arguments.
      # @return [void]
      def run(*args)
        return unless parse_arguments(*args)
        log.puts wrap_layout(format_objects)
      end

      # @return [String] the output data for all formatted objects
      def format_objects
        @objects.inject([]) do |arr, obj|
          arr.push obj.format(options)
        end.join("\n")
      end

      def wrap_layout(contents)
        return contents unless @layout
        opts = options.merge(
          :contents => contents,
          :object => @objects.first,
          :objects => @objects
        )
        args = [options.template, @layout, options.format]
        Templates::Engine.template(*args).run(opts)
      end

      # Parses commandline options.
      # @param [Array<String>] args each tokenized argument
      def parse_arguments(*args)
        parse_yardopts_options(*args)
        parse_rdoc_document_file
        parse_yardopts
        optparse(*args)
        find_readme

        add_visibility_verifier
        add_api_verifier

        Registry.load
        @objects = files.map do |o|
          if o.start_with?("file:")
            options.files.find { |f| f.filename == o[5..-1] }
          else
            Registry.at(o)
          end
        end

        # validation
        return false if @objects.any?(&:nil?)
        verify_markup_options
      end

      def optparse(*args)
        opts = OptionParser.new
        opts.banner = "Usage: yard display [options] OBJECT [OTHER OBJECTS]"
        general_options(opts)
        output_options(opts)
        common_options(opts)
        parse_options(opts, args)
        parse_files(*args) unless args.empty?
      end

      def output_options(opts)
        super(opts)
        opts.on('-l', '--layout [LAYOUT]', 'Wraps output in layout template (good for HTML)') do |layout|
          @layout = layout || 'layout'
        end
      end
    end
  end
end
