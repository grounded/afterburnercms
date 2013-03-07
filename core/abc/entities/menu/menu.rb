require 'active_model'

module Abc

  # This is the actual main menu class. It holds logic for spitting out menus.
  # It doesn't know how to render each node; it just knows how to spit out a
  # tree.
  class Menu
    include ActiveModel::Model

    # This holds a tree of entries.
    attr_accessor :entries

    def initialize
      self.entries = []
    end

  end
end
