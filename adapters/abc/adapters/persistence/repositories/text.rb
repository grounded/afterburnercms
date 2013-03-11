require_relative 'base'

module Abc
  module Adapters
    module Persistence
      module Repositories
        class Text < Base
          class << self
            protected
            def kind
              :text
            end
          end
        end
      end
    end
  end
end