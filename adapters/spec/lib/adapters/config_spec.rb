require 'spec_helper'

class Mock; end


module Abc
  module Adapters
    describe Config do
      subject { Mock.send(:extend, Config) }

      it "uses a datastore unless specified otherwise" do
        subject.use_datastore?.should be_true
      end

      it "doesn't use a datastore if told not to" do
        subject.use_datastore = false
        subject.use_datastore?.should be_false
      end

      it "uses a memory datastore by default" do
        subject.datastore_options.should == [:memory]
      end

      it "allows overriding options for datastores" do
        subject.datastore_options = [:sqlite]
        subject.datastore_options.should == [:sqlite]
      end
    end
  end
end
