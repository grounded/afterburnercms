module Abc
  module Frontend
    class PagesController < BaseController
      def index
        @data = OpenStruct.new(::Abc::Frontend::Conductors::ShowsPage.call(params))
      end
    end
  end
end
