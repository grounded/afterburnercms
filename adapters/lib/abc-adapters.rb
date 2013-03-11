$LOAD_PATH.push File.expand_path('../../abc', __FILE__)
require 'adapters/config'
require 'adapters'

module Abc
  module Adapters
    extend Config

    # Override this if you want to change the datastore
    def self.enable_datastore!
      Hyperion.datastore = Abc::Adapters.datastore_from_options(Abc::Adapters.datastore_options)
    end
  end
end

Abc::Adapters.enable_datastore!
