require 'tiny_spec_helper'
require 'abc/frontend/conductors/base.rb'
require 'ostruct'

module Abc
  module Frontend
    module Conductors
      describe Base do
        it "should be callable" do
          Base.should respond_to(:call)
        end

        it "should respond to to_response" do
          Base.send(:new, {}).should respond_to(:to_response)
        end

        it "should require parameters to call" do
          ->{ Base.call}.should raise_error ArgumentError
        end
        # let(:mocks) {{:presenter_classes => {:page => OpenStruct}}}
        # let(:result) { ShowsEmailSignupForm.call({}, mocks) }

        # it "returns a hash of presenters" do
        #   expect(result).to be_kind_of Hash
        # end

        # it "should include a page presenter" do
        #   result[:page].title.should == "Sign up to receive a notification"
        # end

        it "should not be run directly" do
          ->{ Base.call({}) }.should raise_error ResponseNotSpecifiedError
        end
      end
    end
  end
end

