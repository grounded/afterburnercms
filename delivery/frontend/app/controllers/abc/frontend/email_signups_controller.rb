require 'ostruct'
require 'abc/frontend/conductors/shows_email_signup_form'

module Abc
  module Frontend
    class EmailSignupsController < BaseController
      def new
        @data = OpenStruct.new(::Abc::Frontend::Conductors::ShowsEmailSignupForm.call(params))
      end

      def create
        # begin
        @data = OpenStruct.new(::Abc::Frontend::Conductors::AcceptsEmailSignupForm.call(params))
        # rescue
        #   render :action => :new and return
        # end

        render :template => :'abc/frontend/email_signups/thank_you'
      end
    end
  end
end
