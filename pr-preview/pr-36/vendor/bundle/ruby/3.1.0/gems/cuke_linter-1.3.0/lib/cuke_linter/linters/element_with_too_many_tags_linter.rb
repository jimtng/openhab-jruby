module CukeLinter

  # A linter that detects taggable Gherkin elements that have too many tags
  class ElementWithTooManyTagsLinter < Linter

    # Changes the linting settings on the linter using the provided configuration
    def configure(options)
      @tag_threshold   = options['TagCountThreshold']
      @tag_inheritance = options['CountInheritedTags']
    end

    # The rule used to determine if a model has a problem
    def rule(model)
      return false unless relevant_model?(model)

      @linted_model_class   = model.class
      @linted_tag_threshold = @tag_threshold || 5
      @linted_tag_count     = if @tag_inheritance
                                model.all_tags.count
                              else
                                model.tags.nil? ? 0 : model.tags.count
                              end

      @linted_tag_count > @linted_tag_threshold
    end

    # The message used to describe the problem that has been found
    def message
      class_name = @linted_model_class.name.split('::').last

      "#{class_name} has too many tags. #{@linted_tag_count} tags found (max #{@linted_tag_threshold})."
    end


    private


    def relevant_model?(model)
      model.is_a?(CukeModeler::Feature) ||
        model.is_a?(CukeModeler::Scenario) ||
        model.is_a?(CukeModeler::Outline) ||
        model.is_a?(CukeModeler::Example)
    end

  end
end
