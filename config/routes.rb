Abc::Engine.routes.draw do
  root to: 'backend/base#index'

  namespace :backend do
    root to: 'base#index'
  end
end
