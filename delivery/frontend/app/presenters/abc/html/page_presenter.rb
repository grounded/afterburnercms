module Abc
  module Html
    class PagePresenter
      def initialize(page)
        @page = page
      end

      def id
        @page.id
      end
    end
  end
end
