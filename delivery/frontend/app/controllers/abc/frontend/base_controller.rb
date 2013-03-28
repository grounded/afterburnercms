module Abc
  module Frontend
    class BaseController < ApplicationController

      # A set of key/value pairs that specify mappings of presenters to
      # potential data keys.
      #
      # @return [Hash] An associative array to be used in conjunction with
      #   `present`.
      def presenters
        @presenters ||= Hash.new.freeze
      end

      # Does three things:
      #
      # 1. Transforms any value with a corresponding key in `presenters` to an
      # instance of that presenter (i.e. if the keys of the parameter here
      # include `:page`, and `presenters` also contains a `:page` key, the
      # resulting output for that key will be an instance of the class
      # specified as `presenters[:page]`.
      # 2. Transforms the resultant hash into an OpenStruct so that the view
      # can access its keys through dot notation.
      # 3. Assigns this OpenStruct to the @data instance variable so that it
      # can be accessed in the view.
      #
      # @param hsh [Hash] Data to be presented to the view
      def present(data)
        hsh = data.merge(data) do |key, oldval, _|
          presenters.has_key?(key) ? presenters[key].new(oldval) : oldval
        end

        @data = OpenStruct.new hsh
      end
    end
  end
end
