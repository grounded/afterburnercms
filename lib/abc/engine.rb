require 'rails'

module Abc
  class Engine < Rails::Engine
    isolate_namespace Abc
  end
end
