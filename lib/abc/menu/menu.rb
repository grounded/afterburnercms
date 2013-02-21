require 'action_view'
require 'active_model'
require 'active_support/core_ext/string'

module Abc

  # This is the actual main menu class. It holds logic for spitting out menus.
  # But it only knows how to spit out root nodes; it trusts that its children know how
  # to render themselves.
  #
  # TODO: Should it hold the logic for appending items to its tree, or should
  # it just be able to construct itself from arguments? Are there caching
  # benefits? RY 18/02/13
  class Menu
    include ActiveModel::Model
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    attr_accessor :children, :menu_element, :list_element_pair

    # Creates a new instance of the menu.
    # @param attributes [Hash] A hash of attributes to be set on the menu.
      #
    def initialize(attributes = {})
      super
      self.children ||= []
      self.menu_element ||= :nav
      self.list_element_pair ||= [:ul, :li]
    end

    # Outputs the menu in HTML format.
    #
    # @return An HTML-safe string containing the markup of the menu in question.
    def to_html
      content_tag(self.menu_element) do
        content_tag(self.list_element_pair.first) do
          # Reduce will concat into a first SafeBuffer here, so if the first
          # node is html_safe, this will produce expected outcome. And of course,
          # MenuEntries are expected to be html_safe.
          # TODO: Should they be? I'm not sure how we'd render without that.
          #       I think filtering would have to be at a finer level.
          children.reduce(::ActiveSupport::SafeBuffer.new) do |buffer, child|
            child.list_element_pair = self.list_element_pair
            buffer.safe_concat child.to_html
          end if children.any?
        end
      end.html_safe
    end

    # Set the elements that are used to determine what contains a series of
    # children and the actual children itself. Defaults to [:ul, :li].
    # We sometimes refer to the pair as the container and the enumerator.
    #
    # @param pair [Array] A pair of HTML element names
    def list_element_pair=(pair)
      raise "List element pair must be an array" unless pair.is_a?(Array)
      raise "List element pair must specify two element types" unless pair.count == 2
      raise "List element pair should be symbols" unless pair.all? {|e| e.is_a?(Symbol)}
      @list_element_pair = pair
    end
  end
end
