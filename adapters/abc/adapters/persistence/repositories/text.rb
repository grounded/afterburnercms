require 'abc/entities/content/text'

module Abc
  module Adapters
    module Persistence
      module Repositories
        class Text

          class << self
            def store(values)
              sync { Hyperion.save({:kind => :text}.merge(values)) }
            end

            def find(key)
              sync { Hyperion.find_by_key(key) }
            end

            def sync(&block)
              block.call
            end

          end
        end
      end
    end
  end
end
