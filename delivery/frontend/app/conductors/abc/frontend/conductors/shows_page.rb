require 'afterburner/framework/base_conductor'
require 'abc/html/page_presenter'
require 'entities/pages/page'
require 'adapters/persistence/repositories/page'
require 'interactors/pages/builds_page'
require 'ostruct'

module Abc
  module Frontend
    module Conductors
      class ShowsPage < ::Afterburner::Framework::BaseConductor

        # Wraps and organizes response to controller.
        def to_response
          data.merge(data) do |key, value|
            options[:presenter_classes][key.to_sym].new(value)
          end
        end

        protected
        attr_accessor :params, :options
        attr_writer :data

        def initialize(params, opts)
          self.params  = params
          self.options = defaults.merge(opts)

          # Make these a bit prettier.
          @builders   = OpenStruct.new(options[:builder_classes])
          @presenters = OpenStruct.new(options[:presenter_classes])
          @repository = options[:repository_class]

          # Temporarily here, since we need to get the data from somewhere
          @repository.store(:title => "Welcome to page #{params[:id]}")
        end

        # Transforms params into requests to the application, optionally
        # hitting an adapter along the way.
        def data
          {}.merge(build_page)
        end

        def defaults
          {
            :repository_class => ::Abc::Adapters::Persistence::Repositories::Page,
            :presenter_classes => { :page => ::Abc::Html::PagePresenter },
            :builder_classes => { :page => ::Abc::Interactors::BuildsPage }
          }.freeze
        end

        # Retrieve the required page from the database and construct it.j
        def build_page
          page_data = @repository.search.first

          {:page => @builders.page.call(page_data)}
        end

        # We could also chain more methods to our data method. Each should
        # return a hash, that we then wrap with a presenter, or pass on
        # as straight data, depending on our our strategy in #to_response.
        #
        # def build_menu
        #   {}
        # end

      end
    end
  end
end
