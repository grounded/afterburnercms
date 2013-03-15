module Abc
  module Frontend
    module Conductors
      class ResponseNotSpecifiedError < StandardError; end
      class Base
        class << self
          def call(params, options = {})
            new(params, options).to_response
          end
        end

        def to_response
          raise ResponseNotSpecifiedError, "#to_response must be overridden when subclassing Conductors::Base"
        end

        protected
        def initialize(params, options = {})
        end
      end
    end
  end
end
