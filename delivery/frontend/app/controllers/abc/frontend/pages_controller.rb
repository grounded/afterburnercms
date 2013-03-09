require 'ostruct'
require 'abc/frontend/conductors/shows_page'

module Abc
  module Frontend
    class PagesController < BaseController
      def show
        @data = OpenStruct.new(::Abc::Frontend::Conductors::ShowsPage.call(params))
      end
    end
  end
end
