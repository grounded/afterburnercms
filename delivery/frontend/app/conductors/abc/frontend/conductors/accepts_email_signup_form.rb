module Abc
  module Frontend
    module Conductors
      class AcceptsEmailSignupForm
        class << self
          def call(params, options = {})
            new(params, options).to_response
          end
        end

        def to_response
          {}
        end

        private
        def initialize(params, options)
        end
      end
    end
  end
end
