require 'tiny_spec_helper'
require 'abc/frontend/conductors/shows_page'

class MockPagePresenter
  def initialize(vals); @vals = vals; end
  def content; @vals.to_s; end
end

module Abc
  module Frontend
    module Conductors
      describe ShowsPage do
        it "returns a page presenter" do
          result = ShowsPage.call({:id => 1}, {:presenter_class => MockPagePresenter})
          result[:page].content.should == "Welcome to page 1"
        end
      end
    end
  end
end
