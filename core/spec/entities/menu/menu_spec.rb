require 'spec_helper'
require 'abc/entities/menus/menu'

module Abc
  describe Menu do
    let(:menu_entries) do
      [{:title => "One", :children => [{ :title => "One first child"}]}]
    end

    context "without arguments" do
      it "lists nothing when empty" do
        subject.entries.should be_empty
      end
    end

    context "with arguments" do
      subject { Menu.new(menu_entries) }

      it "adds menu entries to menu" do
        expect(subject.entries.first).to be_kind_of(MenuEntry)
      end

      it "lists only root nodes" do
        subject.entries.count.should == 1
      end
    end
  end
end
