module Abc
  module Entities
    module Content
      class Text
        attr_reader :id
        attr_accessor :text

        def initialize(id, text)
          @id = id
          @text = text
        end

        alias_method :to_s, :text
      end
    end
  end
end
