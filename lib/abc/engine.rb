require 'rails'

module ABC
  class Engine < Rails::Engine
    isolate_namespace ABC
  end
end
