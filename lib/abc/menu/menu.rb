require 'active_model'

module Abc

  # This is the actual main menu class. It holds logic for spitting out menus.
  # It doesn't know how to render each node; it just knows how to spit out a
  # tree.
  #
  # TODO: Should it hold the logic for appending items to its tree, or should
  # it just be able to construct itself from arguments? Are there caching
  # benefits? RY 18/02/13
  class Menu
    include ActiveModel::Model

    # This holds a tree of children.
    attr_accessor :children

    # Creates a new instance of the menu.
    # @param attributes [Hash] A hash of attributes to be set on the menu.
    def initialize(attributes = {})
      super
      self.children ||= []
    end

  end
end
