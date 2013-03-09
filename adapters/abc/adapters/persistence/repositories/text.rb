require 'abc/entities/content/text'

module Adapters
  module Persistence
    module Repositories
      class Text
        attr_reader :collection

        def initialize(strategy=InMemoryStrategy)
          @collection = []
          extend strategy
        end

        module InMemoryStrategy
          def find(id)
            found = collection.detect do |item|
              item[:id] == id
            end
            return nil unless found
            Abc::Entities::Content::Text.new(found[:id], found[:text])
          end

          def store(text)
            index = index_of(text)
            collection[index] = hashify(text)
            find(index)
          end

          private
          def hashify(text)
            id = text.id || collection.length
            { id: id, text: text.text }
          end

          def index_of(text)
            existing_text = find(text.id)
            return collection.length unless existing_text
            collection.index(find(text.id))
          end

          def new_id
            collection.length
          end
        end
      end
    end
  end
end
