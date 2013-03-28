require 'spec_helper'
require 'adapters/persistence/repositories/page'

describe "Frontend" do
  before do
    Abc::Adapters.enable_datastore!
    Abc::Adapters::Persistence::Repositories::Page.new.store(:title => "Welcome to page 1", :body => "Welcome to page 1")
  end

  describe "GET /page/1" do
    it "shows the page id" do
      visit abc_frontend.page_path(:id => 1)
      page.should have_content("Welcome to page 1")
    end
  end
end
