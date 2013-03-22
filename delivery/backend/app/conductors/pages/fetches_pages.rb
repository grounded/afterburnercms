require 'afterburner/framework/base_conductor'
require 'interactors/pages/builds_page'
require 'abc-adapters'
require 'abc/page_presenter'

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

        def pages
          @pages ||= data.map {|p| interactors.pages.call(p) }
        end

        def data
          repositories.pages.search({})
        end
      end
    end
  end
end
