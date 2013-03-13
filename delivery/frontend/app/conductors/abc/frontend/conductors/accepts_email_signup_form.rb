require_relative 'base'
require 'ostruct'

module Abc
  module Frontend
    module Conductors
      class AcceptsEmailSignupForm < Base
        def to_response
          {:email_signup => OpenStruct.new(data)}
        end

        protected
        attr_accessor :params, :options
        def initialize(params, options = {})
          self.params = params
          self.options = defaults.merge(options)
        end

        def data
          params[:email_signup]
        end


        def defaults
          {}.freeze
        end
      end
    end
  end
end
