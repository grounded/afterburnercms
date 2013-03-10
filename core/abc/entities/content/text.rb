module Abc
  module Entities
    module Content
      class Text

        attr_accessor :text

        def initialize(text)
          self.text = text
        end

        alias_method :to_s, :text

      end
    end
  end
end
