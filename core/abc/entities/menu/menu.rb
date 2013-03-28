require_relative 'menu_entry'

module Abc

  # This is the actual main menu class. It holds logic for spitting out menus.
  # It doesn't know how to render each node; it just knows how to spit out a
  # tree.
  class Menu

    # This holds a tree of entries.
    attr_accessor :entries

    def initialize(entries = [])
      self.entries = entries.map do |entry|
        MenuEntry.new(entry[:title], entry[:children])
      end
    end

  end
end
