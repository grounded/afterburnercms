require 'spec_helper'

describe "Frontend" do
  describe "GET /" do
    it "shows a welcome message" do
      visit abc_frontend.root_path
      page.should have_content("Welcome to the Afterburner Frontend!")
    end
  end
end
