require 'spec_helper'
require 'abc/entities/content/text'

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

          it "can find a Text by attributes" do
            text = Entities::Content::Text.new('We need to come up with a solution here for truncating our previous entries.')
            key = Text.store(text)[:key]
            result = Text.search(:filters => [[:text, '=', 'We need to come up with a solution here for truncating our previous entries.']])
            result.first[:key].should == key
          end
        end
      end
    end
  end
end
