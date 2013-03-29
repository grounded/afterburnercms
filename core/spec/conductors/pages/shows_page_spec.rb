require 'spec_helper'
require 'conductors/pages/shows_page'

module Abc
  module Conductors
    module Pages
      describe ShowsPage do
        let(:repository)  { double "repository" }
        subject {
          ShowsPage.new({:id => 1}, {
            :repositories => {:pages => repository}
          })
        }

        it "returns a hash" do
          subject.stub!(:build_page)
          expect(subject.call).to be_kind_of Hash
        end

        it "loads from the repository" do
          repository.should_receive(:search).once.and_return [Hash.new]
          subject.send :build_page
        end

        it "constructs a new page entity" do
          repository.stub!(:search).and_return([Hash.new])
          Entities::Page.should_receive(:new).once
          subject.send :build_page
        end

      end
    end
  end
end
