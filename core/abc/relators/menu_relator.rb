require 'abc/entities/menu/menu'
require 'abc/entities/menu/menu_entry'


module Abc
  module Relators
    class MenuRelator
      def initialize(menu_entries)
        @menu = Menu.new
        @menu.entries = menu_entries.map do |entry|
          MenuEntry.new entry[:title], entry[:children]
        end
      end

      def call
        @menu
      end
    end
  end
end
