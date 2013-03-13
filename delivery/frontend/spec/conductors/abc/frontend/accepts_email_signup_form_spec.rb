require 'tiny_spec_helper'
require 'abc/frontend/conductors/accepts_email_signup_form'

module Abc
  module Frontend
    module Conductors
      describe AcceptsEmailSignupForm do
        subject { AcceptsEmailSignupForm }
        let(:params) { {:email_signup => {:email => "rob@afterburnercms.com" }} }
        let(:mocks) { {} }
        let(:result) { subject.call(params, mocks) }

        it "returns a hash" do
          expect(result).to be_kind_of Hash
        end

        it "returns a hash containing an email signup" do
          result[:email_signup].should respond_to(:email)
        end
      end
    end
  end
end
