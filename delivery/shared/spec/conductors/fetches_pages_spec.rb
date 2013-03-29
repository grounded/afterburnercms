require 'tiny_spec_helper'
require 'pages/fetches_pages'
require 'ostruct'
require 'pry'

module Abc
  module Conductors
    module Pages
      describe FetchesPages do

        let(:mocks) do
          {
            :presenters => {:pages => Presenter },
            :repositories => {:pages => Repository }
          }
        end
        let(:params) { {} }
        let(:conductor) { FetchesPages.new(params, mocks) }
        let(:fake) { Class }

        before do
          %w(Presenter Repository).each {|t| stub_const(t, fake.new) }
          Presenter.should_receive(:new).and_return(fake.new)
        end

        describe "return" do
          before do
            conductor.stub(:pages).and_return [fake.new]
          end

          it "is a hash of data" do
            expect(conductor.call).to be_kind_of Hash
          end

          it "includes pages" do
            conductor.to_response[:pages].should be_present
          end
        end

        describe "data" do
          it "comes from the repository" do
            Repository.should_receive(:search).with({}).and_return([fake.new])
            conductor.send(:data)
          end
        end

      end
    end
  end
end
