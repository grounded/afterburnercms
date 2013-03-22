Abc::Backend::Engine.routes.draw do
  root to: 'base#index'

  resources :pages
end
