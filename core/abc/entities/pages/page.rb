module Abc
  module Entities
    class Page
      attr_reader :title, :body

      def initialize(title, body)
        @title = title
        @body = body
      end

      def to_hash
        {:title => title, :body => body}
      end
    end
  end
end

