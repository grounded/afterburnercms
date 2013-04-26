require_relative 'base'
require 'entities/content/text'

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

            def entity_class
              Entities::Content::Text
            end
          end
        end
      end
    end
  end
end
