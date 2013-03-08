require 'spec_helper'
require 'creates_menu'

module Abc
  module Interactors
    describe CreatesMenu do
      let(:menu_entries) do
        [{:title => "One", :children => [{ :title => "One first child"}]}]
      end

      describe ".new" do
        it "creates new menu" do
          menu_creator = CreatesMenu.new([])
          expect(menu_creator.menu).to be_kind_of(Abc::Menu)
        end

        it "adds menu entries to menu" do
          menu_creator = CreatesMenu.new(menu_entries)
          menu_creator.menu.entries.each do |menu_entry|
            expect(menu_entry).to be_kind_of(Abc::MenuEntry)
          end
        end
      end

      describe "#call" do
        it "returns menu" do
          menu_creator = CreatesMenu.new(menu_entries)
          expect(menu_creator.call).to be_kind_of(Abc::Menu)
        end
      end
    end
  end
end
