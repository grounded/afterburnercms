require_relative 'base'
require 'entities/pages/page'

module Abc
  module Adapters
    module Persistence
      module Repositories
        class Page < Base
          protected
          def kind
            :page
          end

          def entity_class
            Entities::Pages::Page
          end
        end
      end
    end
  end
end
