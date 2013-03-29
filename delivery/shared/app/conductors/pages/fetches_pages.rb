require 'afterburner/framework/base_conductor'
require 'abc-adapters'
require 'entities/pages/page'
require 'presenters/abc/page_presenter'

module Abc
  module Conductors
    module Pages
      class FetchesPages < ::Afterburner::Framework::BaseConductor

        def to_response
          pages
        end

        protected
        def pages
          @pages ||= data.map {|p| Entities::Page.new(p) }
        end

        def data
          page_repository.search({})
        end

        private
        def page_repository
          repositories.page
        end
      end
    end
  end
end
