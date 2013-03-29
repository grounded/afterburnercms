require 'afterburner/framework/base_conductor'
require 'abc-adapters'

module Abc
  module Conductors
    module Pages
      class AcceptsPageForm < ::Afterburner::Framework::BaseConductor

        def call
          save_page

          { page: @saved_page }
        end

        protected

        def defaults
          {
            :repositories => {
              :pages => Adapters::Persistence::Repositories::Page.new
            }
          }
        end

        def page
          Entities::Page.new params
        end

        def save_page
          @saved_page = page_repository.store page.to_hash
        end

        private
        def page_repository
          repositories.pages
        end
      end
    end
  end
end

