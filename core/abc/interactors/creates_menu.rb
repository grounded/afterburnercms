require 'afterburner/framework/base_interactor'
require 'entities/menu/menu'
require 'entities/menu/menu_entry'

module Abc
  module Interactors
    class CreatesMenu < ::Afterburner::Framework::BaseInteractor
      attr_reader :menu

      def to_response
        menu
      end

      def initialize(menu_entries, options = {})
        @menu = Menu.new
        @menu.entries = menu_entries.map do |entry|
          MenuEntry.new entry[:title], entry[:children]
        end
      end

    end
  end
end
