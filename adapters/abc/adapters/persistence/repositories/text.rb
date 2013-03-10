module Abc
  module Adapters
    module Persistence
      module Repositories
        class Text

          class << self
            def store(values)
              Hyperion.save({:kind => :text}.merge(values))
            end

            def find(key)
              Hyperion.find_by_key(key)
            end

            def search(options = {})
              Hyperion.find_by_kind(:text, options)
            end

          end
        end
      end
    end
  end
end
