module Abc
  module Frontend
    module Conductors
      class ShowsEmailSignupForm
        class << self
          def call(params, options = {})
            new(params, options).to_response
          end
        end

        def to_response
          {:page => OpenStruct.new(:title => "Sign up to receive a notification")}
        end

        protected
        def initialize(params, options)
        end

      end
    end
  end
end
