require 'tiny_spec_helper'
require 'presenters/abc/html/menu_presenter'

class MenuEntryMock
  include ActionView::Helpers::TagHelper
  def initialize(name); @name = name; end
  def title; @title ||= rand(30).times.map{|i| ('A'..'Z').to_a.sample}.join end
  attr_accessor :children
end

class MenuEntryPresenterMock
  attr_accessor :menu_entry, :list_element_pair
  def initialize(menu_entry, options)
    @menu_entry = menu_entry
    @list_element_pair = options[:list_element_pair]
  end
  def to_html; "<#{list_element_pair.last}>#{menu_entry.title}</#{list_element_pair.last}>"; end
end

class MenuMock
  attr_accessor :children
  def initialize(options = {}); @children = options[:children] || []; end
end


module Abc
  module Html
    describe MenuPresenter do
      let(:list_element_pair) { [:ul, :li] }
      let(:entry1) { MenuEntryMock.new("node 1") }
      let(:entry1_presenter) { MenuEntryPresenterMock.new(entry1, :list_element_pair => list_element_pair) }
      let(:entry2) { MenuEntryMock.new("node 2") }
      let(:entry2_presenter) { MenuEntryPresenterMock.new(entry2, :list_element_pair => list_element_pair) }
      let(:menu) { MenuMock.new(:children => [entry1, entry2]) }
      let(:presenter_options) do
        {
          :menu_entry_presenter_class => MenuEntryPresenterMock,
          :list_element_pair => list_element_pair
        }
      end
      let(:presenter) { MenuPresenter.new(menu, presenter_options) }
      # TODO: Add specs for list element pair squawks, or refactor these into
      #       two separate param. How do we handle codependence, then?
      #       i.e. since this is a ul and an li, what if people change
      #       the ul but not the li? Is this something that our API can make
      #       clearer than it is at the moment?

      it "asks its children to render themselves" do
        presenter.to_html
      end

      it "draws its children in order" do
        presenter.to_html.should == "<nav><ul>%s%s</ul></nav>" % [entry1_presenter.to_html, entry2_presenter.to_html]
      end

      it "is considered HTML safe" do
        presenter.to_html.html_safe?.should be_true
      end

      it "allows an alternate root element" do
        presenter.menu_element = :div
        presenter.to_html.should match(/\A<div/)
      end

      context 'with alternate list element pair' do
        let(:list_element_pair) { [:menu, :div] }

        it "allows" do
          presenter.to_html.should match(/\A<nav><menu><div>/)
        end
      end
    end
  end
end
