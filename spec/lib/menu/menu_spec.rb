require 'spec_helper'
require 'abc/menu/menu'

class MockMenuEntry
  include ActionView::Helpers::TagHelper
  def initialize(name); @name = name; end
  def to_html(list_el = :li); content_tag(list_el, @name).html_safe; end
end

module Abc
  describe Menu do
    let(:entry1) { MockMenuEntry.new("node 1") }
    let(:entry2) { MockMenuEntry.new("node 2") }
    let(:menu) { Menu.new([entry1, entry2]) }

    describe "listing" do

      it "lists nothing when empty" do
        subject.nodes.should be_empty
      end

      it "lists root nodes" do
        menu.nodes.should == [entry1, entry2]
      end
    end

    describe "rendering" do
      describe "HTML" do
        it "asks its nodes to render themselves" do
          entry1.should_receive(:to_html).and_return("<li>node 1</li>".html_safe)
          menu.to_html
        end

        it "draws its nodes in order" do
          menu.to_html.should == "<nav><ul>%s%s</ul></nav>" % [entry1.to_html, entry2.to_html]
        end

        it "is considered HTML safe" do
          menu.to_html.html_safe?.should be_true
        end

        it "allows an alternate root element" do
          menu.menu_element = :div 
          menu.to_html.should match(/\A<div/)
        end

        it "allows an alternate list element pair" do
          menu.list_element_pair = [:menu, :div]
          menu.to_html.should match(/\A<nav><menu><div>/)
        end

        # TODO: Add specs for list element pair squawks, or refactor these into
        #       two separate param. How do we handle codependence, then?
        #       i.e. since this is a ul and an li, what if people change
        #       the ul but not the li? Is this something that our API can make
        #       clearer than it is at the moment?
      end
    end

  end
end
