require 'spec_helper'
require 'abc/entities/menus/menu_entry'

module Abc
  describe MenuEntry do
    it "wraps passed children" do
      e = MenuEntry.new('My title', [{:title => 'Child 1'}])
      expect(e.children.first).to be_kind_of Abc::MenuEntry
    end
  end
end
