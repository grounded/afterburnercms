require 'spec_helper'

describe "Pages Interface" do
  describe "GET /backend/pages" do
    before do
      create_page(title: "First Page")
      visit abc_backend.pages_path
    end

    it "shows a list of pages" do
      within('h2') do
        page.should have_content("Pages")
      end
      page.should have_link("First Page", href: '#')
    end

    it "has a link to create a new page" do
      page.should have_link('New Page', href: abc_backend.new_page_path)
    end
  end

  describe "GET /backend/pages/new" do
    before do
      visit abc_backend.new_page_path
    end

    it "shows a form" do
      page.should have_field('Title')
    end
  end

  describe "POST /backend/pages" do
    before do
      visit abc_backend.new_page_path
      fill_in "Title", with: "Foo"
    end

    it "creates a new page" do
      click_button "Create Page"
      page.should have_link("Foo", href: '#')
    end
  end
end

def create_page(attributes={})
  repo = Abc::Adapters::Persistence::Repositories::Page
  repo.store(attributes)
end
