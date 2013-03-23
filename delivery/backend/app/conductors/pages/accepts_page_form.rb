require 'afterburner/framework/base_conductor'
require 'interactors/pages/builds_page'
require 'abc-adapters'
require 'abc/page_presenter'

module Abc
  module Conductors
    module Pages
      class AcceptsPageForm < ::Afterburner::Framework::BaseConductor
        def to_response
          { page: presenters.pages.new(saved_page) }
        end

        protected
        attr_accessor :params, :options, :errors,
                      :interactors, :repositories, :presenters

        def initialize(params, options = {})
          super

          self.interactors  = OpenStruct.new(self.options[:interactor_classes])
          self.repositories = OpenStruct.new(self.options[:repository_classes])
          self.presenters   = OpenStruct.new(self.options[:presenter_classes])
        end

        def defaults
          {
            :interactor_classes => { :pages => Abc::Interactors::BuildsPage },
            :repository_classes => { :pages => Abc::Adapters::Persistence::Repositories::Page },
            :presenter_classes  => { :pages => Abc::Presenters::PagePresenter }
          }
        end

        def page
          interactors.pages.call(params)
        end

        def saved_page
          repositories.pages.store(page.to_hash)
        end
      end
    end
  end
end

