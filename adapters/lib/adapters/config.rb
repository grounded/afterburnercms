require 'hyperion'

module Abc
  module Adapters
    module Config

      def datastore_from_options(opts)
        Hyperion.datastore = Hyperion.new_datastore(*opts) if use_datastore?
      end

      def use_datastore?
        @use_datastore.nil? ? true : @use_datastore
      end

      def use_datastore=(val)
        @use_datastore = val
      end

      def datastore_options
        @datastore_options ||= [:memory]
      end

      def datastore_options=(opts)
        @datastore_options = opts
      end
    end
  end
end

