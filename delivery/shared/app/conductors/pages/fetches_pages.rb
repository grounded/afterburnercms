require 'afterburner/framework/base_conductor'
require 'abc-adapters'
require 'entities/pages/page'

module Abc
  module Conductors
    module Pages
      class FetchesPages < ::Afterburner::Framework::BaseConductor

        def call
          data
        end

        protected
        def data
          {:pages => pages}
        end

        def pages
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
