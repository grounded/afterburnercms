require 'tiny_spec_helper'
require 'entities/abc/menu/menu'

describe "Menu" do
  describe "when using an HTML presenter" do
    let(:children_for_one) {
      [{:title => "One first child"}, {:title => "One second child"}]
    }
    let(:menu_entries) do
      [
        {:title => "One", :children => children_for_one}
      ]
    end

    def menu
      Abc::Menu.new menu_entries
    end

    def present
      Abc::Html::MenuPresenter.new(menu).to_html
    end

    it "renders properly" do
      present.should == "<nav><ul><li>One<ul><li>One first child</li><li>One second child</li></ul></li></ul></nav>"
    end
  end
end
