require 'spec_helper'
require 'abc/menu/menu'

module Abc
  describe Menu do
    it "lists nothing when empty" do
      subject.children.should be_empty
    end

    it "lists root nodes" do
      entry1 = "node"
      entry2 = "node2"
      subject.children = [entry1, entry2]
      subject.children.should == [entry1, entry2]
    end
  end
end
