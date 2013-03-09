require 'spec_helper'

describe Adapters::Persistence::Repositories::Text do
  subject{ Adapters::Persistence::Repositories::Text.new }

  it "can retrieve a Text by id" do
    text1 = { id: 1, text: 'foo' }
    text2 = { id: 2, text: 'bar' }
    subject.stub(:collection).and_return([text1, text2])
    subject.find(1).should be_a Abc::Entities::Content::Text
    subject.find(1).text.should == 'foo'
  end

  it "can store a new Text" do
    text = Abc::Entities::Content::Text.new(nil, 'giggity')
    subject.store(text).should be_a Abc::Entities::Content::Text
    subject.store(text).text.should == 'giggity'
  end
end
