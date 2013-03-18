require 'spec_helper'
require 'abc/interactors/creates_menu'

module Abc
  module Interactors
    describe CreatesMenu do
      let(:menu_entries) do
        [{:title => "One", :children => [{ :title => "One first child"}]}]
      end

      describe ".new" do
        it "creates new menu" do
          menu_creator = CreatesMenu.send(:new, [])
          expect(menu_creator.to_response).to be_kind_of(Abc::Menu)
        end

        it "adds menu entries to menu" do
          menu_creator = CreatesMenu.send(:new, menu_entries)
          menu_creator.menu.entries.each do |menu_entry|
            expect(menu_entry).to be_kind_of(Abc::MenuEntry)
          end
        end
      end

      it "returns a menu" do
        menu_creator = CreatesMenu.call(menu_entries)
        expect(menu_creator).to be_kind_of(Abc::Menu)
      end
    end
  end
end
