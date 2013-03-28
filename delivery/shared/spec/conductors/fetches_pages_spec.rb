require 'tiny_spec_helper'
require 'pages/fetches_pages.rb'
require 'ostruct'

module Abc
  module Conductors
    module Pages
      describe FetchesPages do

        let(:mocks) {{ :presenters => {:pages => Presenter },
                       :interactor_classes => {:pages => Interactor },
                       :repositories => {:pages => Repository }}}

        let(:result) { Abc::Conductors::Pages::FetchesPages.call({}, mocks) }
        let(:fake) { Class }

        before do
          %w(Presenter Repository Interactor).each {|t| stub_const(t, fake.new) }
          Presenter.stub!(:new).and_return(fake.new)
          klass = ::Abc::Conductors::Pages::FetchesPages
          @conductor = klass.send(:new, {}, mocks)
        end

        describe "return" do
          before do
            @conductor.stub!(:pages).and_return([fake.new])
          end

          it "is a hash of data" do
            expect(@conductor.to_response).to be_kind_of Hash
          end

          it "includes pages" do
            @conductor.to_response.keys.should include(:pages)
          end
        end

        describe "data" do
          it "comes from the repository" do
            Repository.should_receive(:search).with({}).and_return([fake.new])
            @conductor.send(:data)
          end

          it "is handed to an interactor" do
            data = double "data"
            @conductor.stub!(:data).and_return([data])
            Interactor.should_receive(:call).with(data).and_return(data)
            @conductor.send(:pages)
          end
        end

      end
    end
  end
end
