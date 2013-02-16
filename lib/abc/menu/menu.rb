# Apparently I need this because autoloading? ActiveSupport::Concern fails to load otherwise.
require 'action_view'
require 'active_support/core_ext/string'
# require 'action_view/helpers/tag_helper'

module Abc

  # This is the actual main menu class. It holds logic for spitting out menus.
  # But it only knows how to spit out root nodes; it trusts that nodes know how
  # to render themselves.
  #
  # TODO: Should it hold the logic for appending items to its tree, or should
  #       it just be able to construct itself from arguments?
  #       Are there caching benefits?
  class Menu
    include ActionView::Helpers::TagHelper
    include ActionView::Context # Nested content_tags.

    attr_accessor :nodes, :menu_element
    attr_reader :list_element_pair
    protected :nodes=

    def initialize(els = [])
      self.nodes = els
      self.menu_element = :nav
      self.list_element_pair = [:ul, :li]
    end

    # Outputs the menu in HTML format.
    #
    # @return An HTML-safe string containing the markup of the menu in question.
    def to_html
      content_tag(menu_element) do
        content_tag(list_element_pair.first) do
          # Reduce will concat into a first SafeBuffer here, so if the first
          # node is html_safe, this will produce expected outcome. And of course,
          # MenuEntries are expected to be html_safe.
          # TODO: Should they be? I'm not sure how we'd render without that.
          #       I think filtering would have to be at a finer level.
          nodes.map {|n| n.to_html(list_element_pair.last) }.reduce(:<<) if nodes.count.nonzero?
        end
      end.html_safe
    end

    # Set the elements that are used to determine what contains a series of
    # nodes and the actual nodes itself. Defaults to [:ul, :li].
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
