require 'ostruct'
require 'pages/fetches_pages'
require 'pages/accepts_page_form'

module Abc
  module Backend
    class PagesController < ApplicationController
      def index
        @data = OpenStruct.new(Abc::Conductors::Pages::FetchesPages.call(params))
      end

      def new
      end

      def create
        @data = OpenStruct.new(Abc::Conductors::Pages::AcceptsPageForm.call(params))
        redirect_to pages_path
      end
    end
  end
end
