require 'abc/entities/pages/page'

module Abc
  module Interactors
    class BuildsPage
      attr_reader :page

      def initialize(data)
        @page = Entities::Page.new(data[:title])
      end

      def call
        page
      end
    end
  end
end


