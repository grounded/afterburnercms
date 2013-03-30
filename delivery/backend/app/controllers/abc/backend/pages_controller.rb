require 'conductors/pages/fetches_pages'
require 'conductors/pages/accepts_page_form'
require 'abc/presentation'
require 'abc/html/page_presenter'

module Abc
  module Backend
    class PagesController < ApplicationController
      include Abc::Presentation

      def index
        present Conductors::Pages::FetchesPages.new(params, :repositories => repositories).call
      end

      def new
        # Maybe?
        # @page = Entities::Page.new
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
