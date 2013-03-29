require 'tiny_spec_helper'
require 'presenters/abc/html/page_presenter'
require 'ostruct'

module Abc
  module Html
    describe PagePresenter do
      let(:page) do
        p = mock('page')
        p.stub(:title).and_return('foo')
        p
      end

      subject { PagePresenter.new(page) }

      its(:title) { should == 'foo' }
    end
  end
end
