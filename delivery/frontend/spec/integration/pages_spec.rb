require 'spec_helper'

describe "Frontend" do
  describe "GET /pages" do
    it "shows the page id" do
      visit abc_frontend.pages_path
      page.should have_content("Welcome to page 1")
    end
  end
end
