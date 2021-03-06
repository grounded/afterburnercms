# TODO: These should probably be namespaced under hyperion, too, since they are
# explicitly relevant to it.
# Thought: move the actual domain-specific query objects into the DSL, and use
# this as the cross-barrier interface.
# That would let us do something to standardize the interface so we could potentially
# work with AR.

module Abc
  module Adapters
    module Persistence
      module Repositories
        class Base
          # Serialize a hash to the datastore.
          def store(values)
            entity_class.new Hyperion.save({:kind => kind}.merge(values))
          end

          # Find an entity by its key.
          def find(key)
            entity_class.new Hyperion.find_by_key(key)
          end

          # Search for an entity.
          def search(options = {})
            Hyperion.find_by_kind(kind, options).map do |item|
              entity_class.new item
            end
          end

          protected
          def kind
            raise NotImplementedError, "kind was not specified in repository."
          end

          def entity_class
            raise NotImplementedError, "entity_class was not specified in repository."
          end
        end
      end
    end
  end
end




