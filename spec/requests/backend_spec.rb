require 'spec_helper'

describe "Backend" do
  describe "GET /backend" do
    it "shows a welcome message" do
      visit abc.backend_root_path
      page.should have_content("Welcome to AfterburnerCMS")
    end
  end
end
