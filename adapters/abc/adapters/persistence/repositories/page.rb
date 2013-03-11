require_relative 'base'

module Abc
  module Adapters
    module Persistence
      module Repositories
        class Page < Base
          class << self
            protected
            def kind
              :page
            end
          end
        end
      end
    end
  end
end
