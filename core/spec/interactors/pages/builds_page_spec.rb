require 'spec_helper'
require 'abc/interactors/pages/builds_page'

module Abc
  module Interactors
    describe BuildsPage do
      let(:data) {{:title => "More like Awesome-burner, amirite??"}}
      
      describe "#new" do
        it "creates a page" do
          builder = BuildsPage.new(data)
          expect(builder.page).to be_kind_of(Abc::Entities::Page)
        end
      end

      describe "#call" do
        it "returns the page" do
          builder = BuildsPage.new(data)
          expect(builder.call).to be_kind_of(Abc::Entities::Page)
        end
      end
    end
  end
end
