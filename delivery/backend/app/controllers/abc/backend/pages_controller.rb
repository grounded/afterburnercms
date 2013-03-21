require 'entities/pages/page'
require_relative '../../../presenters/abc/page_presenter' # Need to do load path manip?

module Abc
  module Backend
    class PagesController < ApplicationController
      def index
        pages = repo.search({})
        pages = pages.map{|p| Abc::Entities::Page.new(p[:title]) }
        #pages = [Abc::Entities::Page.new('First Page')] # Get these from somewhere
        @pages = pages.map{|p| Abc::Presenters::PagePresenter.new(p) }
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
