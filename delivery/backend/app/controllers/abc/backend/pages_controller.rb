require 'ostruct'
require 'conductors/pages/fetches_pages'
require 'pages/accepts_page_form'
require 'presenters/abc/page_presenter'

module Abc
  module Backend
    class PagesController < ApplicationController
      def index
        present Conductors::Pages::FetchesPages.new(params, :repositories => repositories)
      end

      def new
      end

      def create
        Conductors::Pages::AcceptsPageForm.new(params, :repositories => repositories).call
        redirect_to pages_path
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
