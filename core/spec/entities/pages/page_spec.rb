require 'spec_helper'
require 'abc/entities/pages/page'

module Abc
  module Entities
    describe Page do
      let(:title) { "Afterburner" }
      subject { Page.new(title) }

      it "has a title" do
        subject.title.should == title
      end

      it "can be hashified" do
        subject.to_hash.should == {:title => title}
      end
    end
  end
end
