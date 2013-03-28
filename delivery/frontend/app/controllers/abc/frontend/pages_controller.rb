require 'ostruct'
require 'abc/frontend/conductors/shows_page'

require 'abc/html/page_presenter'
require 'adapters/persistence/repositories/page'

module Abc
  module Frontend
    class PagesController < BaseController
      def show
        present Conductors::ShowsPage.new(params, :repositories => repositories).call
      end

      protected
      def repositories
        @repositories ||= {:page => Adapters::Persistence::Repositories::Page.new}
      end

      def presenters
        @presenters ||= {:page => Presenters::PagePresenter}
      end

    end
  end
end
