module Abc
  module Entities
    module Content
      class Text
        attr_accessor :text

        def initialize(text)
          @text = text
        end

        def to_hash
          {:text => text}
        end

        alias_method :to_s, :text
      end
    end
  end
end
