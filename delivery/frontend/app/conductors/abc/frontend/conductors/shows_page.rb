require 'abc/html/page_presenter'
require 'ostruct'

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
            :presenter_class => ::Abc::Html::PagePresenter
          }.merge(options)

          # Store these for future use
          self.params = params
        end

        # Here, we can transform our params into the data we want to return
        # We could hit up any adapter or API we want.
        def data
          params
        end

      end
    end
  end
end
