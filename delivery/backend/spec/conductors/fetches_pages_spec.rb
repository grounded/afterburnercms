require 'spec_helper'
require_relative '../../app/conductors/pages/fetches_pages.rb'

module Abc
  module Conductors
    module Pages
      describe FetchesPages do
        let(:page1) { create_page({:title => "Afterburner CMS"}) }
        let(:page2) { create_page({:title => "Afterburner CMS 2"}) }
        let(:result) { FetchesPages.call({}, {}) }

        it "returns an array of pages" do
          FetchesPages.any_instance.stub(:data).and_return([page1, page2])
          FetchesPages.call({}).length.should == 2
        end

        it "pulls the correct data from the repository" do
          result.each do |page|
            page.should be_kind_of Abc::Entities::Page
          end
        end

      end
    end
  end
end

def create_page(attributes={})
  repo = Abc::Adapters::Persistence::Repositories::Page
  repo.store(attributes)
end
