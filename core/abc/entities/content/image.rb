module Abc
  module Entities
    module Content
      class Image

        attr_accessor :url

        def initialize(url)
          @url = url
        end

        alias_method :to_s, :url

      end
    end
  end
end
