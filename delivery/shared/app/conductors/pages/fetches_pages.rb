require 'afterburner/framework/base_conductor'
require 'abc-adapters'
require 'entities/pages/page'
require 'presenters/abc/page_presenter'

module Abc
  module Conductors
    module Pages
      class FetchesPages < ::Afterburner::Framework::BaseConductor

        def to_response
          {:pages => pages.map {|p| presenters.pages.new(p)}}
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
            :repositories => { :pages => Abc::Adapters::Persistence::Repositories::Page.new },
            :presenters  => { :pages => Abc::Presenters::PagePresenter }
          }
        end

        def pages
          @pages ||= data.map {|p| Entities::Page.new(p) }
        end

        def data
          page_repository.search({})
        end

        private
        def page_repository
          repositories.pages
        end
      end
    end
  end
end
