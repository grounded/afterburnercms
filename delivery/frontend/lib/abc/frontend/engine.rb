module Abc
  module Frontend
    class Engine < Rails::Engine
      isolate_namespace Abc::Frontend
    end
  end
end
