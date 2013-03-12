require 'tiny_spec_helper'
require 'abc/frontend/conductors/shows_page'

class MockPagePresenter
  def initialize(vals); @vals = vals; end
  def title; @vals.title; end
end

class MockRepository
  def self.store(obj); @obj = obj.to_hash; end
  def self.search; [@obj]; end
end

class MockPageBuilder
  def initialize(hash); @data = OpenStruct.new(hash); end
  def call; @data; end
end


module Abc
  module Frontend
    module Conductors
      describe ShowsPage do
        let(:mocks) { { :repository_class => MockRepository,
                        :presenter_classes => { :page => MockPagePresenter },
                        :builder_classes => { :page => MockPageBuilder } } }

        let(:result) { ShowsPage.call({:id => 1}, mocks) }
        let(:instance) { ShowsPage.send(:new, {:id => 1}, mocks) }

        it "returns a hash of presenters" do
          expect(result).to be_kind_of Hash
        end

        it "should include a page presenter" do
          result[:page].title.should == "Welcome to page 1"
        end

      end
    end
  end
end
