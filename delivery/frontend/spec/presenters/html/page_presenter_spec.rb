require 'tiny_spec_helper'
require 'presenters/abc/html/page_presenter'
require 'ostruct'

module Abc
  module Html
    describe PagePresenter do
      let(:page) do
        p = mock('page')
        p.stub(:to_s).and_return('foo')
        p
      end
      subject { PagePresenter.new(page) }

      its(:content) { should == 'foo' }
    end
  end
end
