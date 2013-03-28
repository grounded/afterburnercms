module Abc
  module Entities
    class Page
      attr_reader :title, :body

      def initialize(attributes)
        @title = attributes[:title]
        @body = attributes[:body]
      end

      def to_hash
        {:title => title, :body => body}
      end
    end
  end
end

