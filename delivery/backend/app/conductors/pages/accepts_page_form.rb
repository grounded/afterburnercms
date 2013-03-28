require 'afterburner/framework/base_conductor'
require 'abc-adapters'
require 'presenters/abc/page_presenter'

module Abc
  module Conductors
    module Pages
      class AcceptsPageForm < ::Afterburner::Framework::BaseConductor

        def call
          page_repository.store page.to_hash

          to_response
        end

        def to_response
          { page: page_presenter.new(@saved_page) }
        end

        protected
        attr_accessor :params, :options, :errors,
                      :interactors, :repositories, :presenters

        def initialize(params, options = {})
          super

          self.repositories = OpenStruct.new(self.options[:repositories])
          self.presenters   = OpenStruct.new(self.options[:presenters])
        end

        def defaults
          {
            :repositories => { :pages => Adapters::Persistence::Repositories::Page.new },
            :presenters  => { :pages => Presenters::PagePresenter }
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

        def page_presenter
          presenters.pages
        end
      end
    end
  end
end

