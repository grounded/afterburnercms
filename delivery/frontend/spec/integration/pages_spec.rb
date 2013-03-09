require 'spec_helper'

describe "Frontend" do
  describe "GET /page/1" do
    it "shows the page id" do
      visit abc_frontend.page_path(:id => 1)
      page.should have_content("Welcome to page 1")
    end
  end
end
