require_relative '../../../conductors/pages/fetches_pages'
module Abc
  module Backend
    class PagesController < ApplicationController
      def index
        pages = Abc::Conductors::Pages::FetchesPages.call({})
        presenter = Abc::Presenters::PagePresenter
        @pages = pages.map{|p| presenter.new(p) }
      end

      def new
      end

      def create
        new_page = Abc::Entities::Page.new(params[:title])
        repo.store(new_page.to_hash)
        redirect_to pages_path
      end

      private
      def repo
        Abc::Adapters::Persistence::Repositories::Page
      end
    end
  end
end
