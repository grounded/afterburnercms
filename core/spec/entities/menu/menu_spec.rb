require 'spec_helper'
require 'menu/menu'

module Abc
  describe Menu do
    it "lists nothing when empty" do
      subject.entries.should be_empty
    end

    it "lists root nodes" do
      entry1 = "node"
      entry2 = "node2"
      subject.entries = [entry1, entry2]
      subject.entries.should == [entry1, entry2]
    end
  end
end
