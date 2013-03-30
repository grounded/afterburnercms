module Abc
  module Shared
    class Engine < Rails::Engine
      isolate_namespace Abc::Shared
    end
  end
end
