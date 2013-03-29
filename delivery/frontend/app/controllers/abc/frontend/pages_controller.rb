require 'conductors/pages/shows_page'
require 'adapters/persistence/repositories/page'
require 'abc/presentation'
require 'abc/html/page_presenter'

module Abc
  module Frontend
    class PagesController < ApplicationController
      include Abc::Presentation

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
