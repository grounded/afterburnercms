require_relative 'base'

module Abc
  module Frontend
    module Conductors
      class ShowsEmailSignupForm < Base

        def to_response
          {:page => OpenStruct.new(:title => "Sign up to receive a notification")}
        end

      end
    end
  end
end
