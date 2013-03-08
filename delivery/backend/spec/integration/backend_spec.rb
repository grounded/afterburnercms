require 'spec_helper'

describe "Backend" do
  describe "GET /backend" do
    it "shows a welcome message" do
      visit abc_backend.root_path
      page.should have_content("Welcome to Afterburner CMS")
    end
  end
end
