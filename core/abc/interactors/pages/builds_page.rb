require 'afterburner/framework/base_interactor'
require 'entities/pages/page'

module Abc
  module Interactors
    class BuildsPage < ::Afterburner::Framework::BaseInteractor
      attr_reader :page

      def to_response
        page
      end

      protected
      def initialize(data, options = {})
        @page = Entities::Page.new(data[:title])
      end
    end
  end
end


