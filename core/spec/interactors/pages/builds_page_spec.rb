require 'spec_helper'
require 'abc/interactors/pages/builds_page'

module Abc
  module Interactors
    describe BuildsPage do
      let(:data) {{:title => "More like Awesome-burner, amirite??"}}
      
      it "returns a page" do
        builder = BuildsPage.call(data)
        expect(builder).to be_kind_of(Abc::Entities::Page)
      end
    end
  end
end
