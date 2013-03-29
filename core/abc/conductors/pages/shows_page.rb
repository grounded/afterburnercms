require 'afterburner/framework/base_conductor'
require 'entities/pages/page'
require 'ostruct'

module Abc
  module Conductors
    module Pages
      class ShowsPage < ::Afterburner::Framework::BaseConductor

        # Wraps and organizes response to controller.
        def call
          data
        end

        protected
        # Transforms params into requests to the application, optionally
        # hitting an adapter along the way.
        def data
          {:page => build_page}
        end

        # Retrieve the required page from the database and construct it.
        def build_page
          Entities::Page.new page_repository.search(:limit => 1).first
        end

        private
        def page_repository
          repositories.page
        end
      end
    end
  end
end
