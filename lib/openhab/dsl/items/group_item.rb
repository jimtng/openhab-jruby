# frozen_string_literal: true

require 'forwardable'
require 'java'
require 'openhab/dsl/items/item_command'
require 'openhab/dsl/items/item_delegate'
require 'openhab/core/entity_lookup'

module OpenHAB
  module DSL
    module Items
      #
      # A derived class of Array for GroupItem.members
      # so that rule triggers know that we want to create
      # a group state trigger, i.e. 'member of' trigger
      #
      class MembersOfGroup < Array
        attr_reader :group

        def initialize(group:, members:)
          super(members)
          @group = group
        end
      end

      #
      # Delegator to OpenHAB Group Item
      #
      class GroupItem
        extend OpenHAB::DSL::Items::ItemCommand
        extend OpenHAB::DSL::Items::ItemDelegate
        include Enumerable

        def_item_delegator :@group_item

        #
        # Create a new GroupItem
        #
        # @param [Java::Org::openhab::core::items::GroupItem] group_item OpenHAB GroupItem to delegate to
        #
        def initialize(group_item)
          @group_item = group_item

          item_missing_delegate { @group_item }
          item_missing_delegate { members }
          add_state_methods
          add_command_methods
        end

        #
        # Get all members of the group recursively
        #
        # @return [Array] An Array containing all descendants of the Group
        def all_members
          OpenHAB::Core::EntityLookup.decorate_items(@group_item.all_members.to_a)
        end

        #
        # Get the direct members of the group
        #
        # Wraps the members in a MembersOfGroup class, as an indicator to the rule method
        # that the user wishes to trigger based on changes to group items.
        #
        # @return [Array] An Array containing all the direct descendants of the Group
        #
        def members
          MembersOfGroup.new(group: @group_item,
                             members: OpenHAB::Core::EntityLookup.decorate_items(@group_item.members.to_a))
        end

        private

        #
        # Add state methods for the Groups base item type
        #
        def add_state_methods
          data_enums = get_accepted_data_types.select(&:is_enum)
          singleton_class.class_eval do
            data_enums.each { |type| item_state(type.ruby_class) }
          end
        end

        #
        # Add command methods for the Groups base item type
        #
        def add_command_methods
          command_enums = get_accepted_command_types.select(&:is_enum)
          singleton_class.class_eval do
            command_enums.each { |type| item_command(type.ruby_class) }
          end
        end
      end
    end
  end
end
