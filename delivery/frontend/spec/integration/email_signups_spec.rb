require 'spec_helper'

describe "Frontend" do
  before(:each) { Abc::Adapters.enable_datastore! }
  describe "GET /email_signups/new" do
    it "shows the form" do
      visit abc_frontend.new_email_signup_path
      page.should have_content("Sign up")
    end

    it "gets the title from the repository" do
      title = "Sign up to receive a notification" 
      Hyperion.save(:kind => :page, :title => title)
      visit abc_frontend.new_email_signup_path
      within "h1" do
        page.should have_content(title)
      end
    end
  end

  describe "POST /email_signups" do
    it "should receive info from the form" do
      post abc_frontend.email_signups_path(:method => :post), :email_sign_up => { :email => "rob@afterburnercms.com" }
      expect(response).to render_template(:thank_you)
    end
  end
end
