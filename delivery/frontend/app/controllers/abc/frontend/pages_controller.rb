require 'ostruct'
require 'conductors/pages/shows_page'

require 'abc/html/page_presenter'
require 'adapters/persistence/repositories/page'

module Abc
  module Frontend
    class PagesController < BaseController
      def show
        present Conductors::Pages::ShowsPage.new(params, :repositories => repositories).call
      end

      protected
      def repositories
        @repositories ||= {:page => Adapters::Persistence::Repositories::Page.new}
      end

      def presenters
        @presenters ||= {:page => Html::PagePresenter}
      end

    end
  end
end
