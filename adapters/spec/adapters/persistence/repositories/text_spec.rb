require 'spec_helper'

module Abc
  module Adapters
    module Persistence
      module Repositories
        describe Text do
          it "can retrieve a Text by id" do
            text1 = { text: 'foo' }
            key = Text.store(text1)[:key]
            Text.find(key)[:text].should == 'foo'
          end

          it "can store a new Text" do
            text = Entities::Content::Text.new('giggity')
            Text.store(text)[:text].should == 'giggity'
          end
        end
      end
    end
  end
end
