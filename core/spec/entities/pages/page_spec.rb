require 'spec_helper'
require 'abc/entities/pages/page'

module Abc
  module Entities
    module Pages
      describe Page do
        let(:title) { "Afterburner" }
        let(:body) { "Some body text" }
        subject { Page.new({:title => title, :body => body}) }

        it "has a title" do
          subject.title.should == title
        end

        it "has a body" do
          subject.body.should == body
        end

        it "can be hashified" do
          subject.to_hash.should == {:title => title, :body => body}
        end
      end
    end
  end
end
