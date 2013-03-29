require 'tiny_spec_helper'
require 'pages/fetches_pages'
require 'ostruct'

module Abc
  module Conductors
    module Pages
      describe FetchesPages do

        let(:mocks) do
          {:repositories => {:page => Repository }}
        end
        let(:params) { {} }
        let(:conductor) { FetchesPages.new(params, mocks) }
        let(:fake) { Class }

        before { stub_const 'Repository', fake.new }

        describe "return" do
          let(:page) { fake.new }
          before do
            conductor.stub(:pages).and_return [page]
          end

          it "is a hash of data" do
            expect(conductor.call).to be_kind_of Hash
          end

          it "includes page entities" do
            conductor.call[:pages].should include(page)
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
