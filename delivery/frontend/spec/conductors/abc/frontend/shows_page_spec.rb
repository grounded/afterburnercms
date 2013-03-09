require 'tiny_spec_helper'
require 'abc/frontend/conductors/shows_page'
require 'ostruct'

class MockPagePresenter
  def initialize(vals); @vals = vals; end
  def id; @vals.id; end
end

module Abc
  module Frontend
    module Conductors
      describe ShowsPage do
        it "returns a page presenter" do
          result = ShowsPage.call({:id => 1}, {:presenter_class => MockPagePresenter})
          result[:page].id.should == 1
        end
      end
    end
  end
end
