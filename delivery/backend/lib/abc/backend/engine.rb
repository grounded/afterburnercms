require 'rails'

module Abc
  module Backend
    class Engine < Rails::Engine
      isolate_namespace Abc::Backend
    end
  end
end
