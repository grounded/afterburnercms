require 'spec_helper'
require 'abc/menu/menu_entry'
require 'ostruct'

module Abc
  describe MenuEntry do
    describe "rendering" do
      describe "HTML" do
        let(:menu_item) { MenuEntry.new(:title => "ABC 123") }
        let(:child) { OpenStruct.new(:to_html => "<li>Test 123</li>".html_safe) }

        it "renders itself" do
          menu_item.to_html.should == "<li>ABC 123</li>"
        end

        it "renders with the list enumerator of list_element_pair" do
          menu_item.list_element_pair = [:nav, :div]
          menu_item.to_html.should == "<div>ABC 123</div>"
        end

        it "raises an error if its content is not marked html_safe" do
          menu_item.stub!(:render_as_html).and_return("unsafe string")
          expect { menu_item.to_html }.to raise_error(::ActiveSupport::SafeBuffer::SafeConcatError)
        end

        context "with children" do
          it "renders its children" do
            menu_item.stub!(:children).and_return([child])
            menu_item.to_html.should == "<li>ABC 123<ul><li>Test 123</li></ul></li>"
          end

          it "wraps children in the passed list element" do
            pending
          end

        end
          
      end
    end
  end
end
