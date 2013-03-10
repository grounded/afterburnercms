require 'abc/html/page_presenter'
require 'abc/entities/content/text'
require 'adapters/persistence/repositories/text'

module Abc
  module Frontend
    module Conductors
      class ShowsPage

        class << self
          def call(params, options = {})
            new(params, options).to_response
          end
        end

        # Wraps and organizes response to controller.
        def to_response
          {
            :page => options[:presenter_class].new(data)
          }
        end

        protected
        attr_accessor :params, :options
        attr_writer :data

        def initialize(params, options)
          self.options = {
            :presenter_class => ::Abc::Html::PagePresenter,
            :repository_class => ::Abc::Adapters::Persistence::Repositories::Text
          }.merge(options)

          # Store these for future use
          self.params = params
        end

        # Here, we can transform our params into the data we want to return
        # We could hit up any adapter or API we want.
        def data
          # TODO: For now we've mocked out a path in which we received a
          # Text entity from some Interactor.
          # Here, we're persisting it just to test out the loading
          options[:repository_class].store(Entities::Content::Text.new("Welcome to page #{params[:id]}"))
          Entities::Content::Text.new(options[:repository_class].search.first[:text])
        end

      end
    end
  end
end
