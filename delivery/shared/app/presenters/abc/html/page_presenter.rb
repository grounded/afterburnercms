module Abc
  module Html
    class PagePresenter
      def initialize(page)
        @page = page
      end

      def title
        @page.title
      end
    end
  end
end
