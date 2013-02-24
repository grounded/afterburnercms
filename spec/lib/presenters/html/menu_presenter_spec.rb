require 'spec_helper'
require 'abc/presenters/html/menu_presenter'

class MockMenuEntry
  include ActionView::Helpers::TagHelper
  def initialize(name); @name = name; end
  def to_html; content_tag(@list_element_pair.last, @name).html_safe; end
  def list_element_pair=(_); @list_element_pair = _; end
end

class MockMenu
  attr_accessor :children
  def initialize(opts = {}); @children = opts[:children] || []; end
end
  

module Abc
  module Presenters
    module Html
      describe MenuPresenter do
        let(:entry1) { MockMenuEntry.new("node 1") }
        let(:entry2) { MockMenuEntry.new("node 2") }
        let(:menu) { MockMenu.new(:children => [entry1, entry2]) }
        let(:presenter) { MenuPresenter.new(menu) }
        # TODO: Add specs for list element pair squawks, or refactor these into
        #       two separate param. How do we handle codependence, then?
        #       i.e. since this is a ul and an li, what if people change
        #       the ul but not the li? Is this something that our API can make
        #       clearer than it is at the moment?

        it "asks its children to render themselves" do
          entry1.should_receive(:to_html).and_return("<li>node 1</li>".html_safe)
          presenter.to_html
        end

        it "draws its children in order" do
          presenter.to_html.should == "<nav><ul>%s%s</ul></nav>" % [entry1.to_html, entry2.to_html]
        end

        it "is considered HTML safe" do
          presenter.to_html.html_safe?.should be_true
        end

        it "allows an alternate root element" do
          presenter.menu_element = :div
          presenter.to_html.should match(/\A<div/)
        end

        it "allows an alternate list element pair" do
          presenter.list_element_pair = [:menu, :div]
          presenter.to_html.should match(/\A<nav><menu><div>/)
        end
      end
    end
  end
end
