module Abc
  module Html
    class PagePresenter
      def initialize(page)
        @page = page
      end

      def content
        @page.to_s
      end
    end
  end
end
