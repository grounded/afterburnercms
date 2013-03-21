require 'entities/pages/page'
require 'interactors/pages/builds_page'
require_relative '../../presenters/abc/page_presenter' # Need to do load path manip?

module Abc
  module Conductors
    module Pages
      class FetchesPages < Abc::BaseConductor
        attr_accessor :params, :options, :errors, :interactors, :repositories
        def initialize(params, options = {})
          super

          # NOTE: Shamelessly ripped from -website, prolly needs to be standardized
          self.interactors = OpenStruct.new(self.options[:interactor_classes])
          self.repositories = OpenStruct.new(self.options[:repository_classes])
        end

        def to_response
          pages
        end

        private
        def defaults
          {
            :interactor_classes => { :pages => Abc::Interactors::BuildsPage },
            :repository_classes => { :pages => Abc::Adapters::Persistence::Repositories::Page }
          }
        end

        def pages
          @pages ||= data.map{|p| interactors.pages.call(p) }
        end

        def data
          repositories.pages.search({})
        end
      end
    end
  end
end
