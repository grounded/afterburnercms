module Abc
  class BaseInteractor
    class << self
      def call(data, options = {})
        new(data, options).to_response
      end
    end

    def to_response
      raise "#to_response must be specified!"
    end

    protected
    def initialize(data, options = {})
    end
  end
end
