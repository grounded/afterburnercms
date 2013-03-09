require 'tiny_spec_helper'
require 'presenters/abc/html/page_presenter'
require 'ostruct'

module Abc
  module Html
    describe PagePresenter do
      subject { PagePresenter.new(OpenStruct.new(:id => 1)) }
      its(:id) { should == 1 }
    end
  end
end
