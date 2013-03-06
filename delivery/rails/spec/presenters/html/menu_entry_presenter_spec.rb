require 'spec_helper'
require 'ostruct'

class MockMenuEntry
  attr_accessor :children, :title
  def initialize(opts = {}); @children = opts[:children] || []; @title = opts[:title]; end
  def list_element_pair=(_); @list_element_pair = _; end
end

module Abc
  module Html
    describe MenuEntryPresenter do
      let(:menu_item) { MockMenuEntry.new(:title => "Root") }
      let(:child) { MockMenuEntry.new(:title => "Child") }
      subject { MenuEntryPresenter.new(menu_item) }

      it "renders itself" do
        subject.to_html.should == "<li>Root</li>"
      end

      it "renders with the list enumerator of list_element_pair" do
        subject.list_element_pair = [:nav, :div]
        subject.to_html.should == "<div>Root</div>"
      end

      it "raises an error if its content is not marked html_safe" do
        subject.stub!(:render_as_html).and_return("unsafe string")
        expect { subject.to_html }.to raise_error(::ActiveSupport::SafeBuffer::SafeConcatError)
      end

      context "with children" do
        before { menu_item.stub!(:children).and_return([child]) }
        # TODO: Remove this diagnostic spec.
        it "child count should be one" do
          subject.menu_entry.children.count.should == 1
        end

        it "renders its children" do
          subject.to_html.should == "<li>Root<ul><li>Child</li></ul></li>"
        end

        it "wraps children in the passed list element" do
          subject.list_element_pair = [:nav, :div]
          subject.to_html.should == "<div>Root<nav><div>Child</div></nav></div>"
        end
      end
    end
  end
end
