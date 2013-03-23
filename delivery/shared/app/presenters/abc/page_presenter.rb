require 'delegate'

module Abc
  module Presenters
    class PagePresenter < SimpleDelegator
      def to_s
        title
      end
    end
  end
end
