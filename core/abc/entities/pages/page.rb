module Abc
  module Entities
    class Page
      attr_reader :title

      def initialize(title)
        @title = title
      end

      def to_hash
        {:title => title}
      end
    end
  end
end

