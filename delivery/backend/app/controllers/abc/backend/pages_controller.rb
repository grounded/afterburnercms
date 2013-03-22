require 'ostruct'
require 'pages/fetches_pages'

module Abc
  module Backend
    class PagesController < ApplicationController
      def index
        @data = OpenStruct.new(Abc::Conductors::Pages::FetchesPages.call(params))
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
