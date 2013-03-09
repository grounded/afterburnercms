Abc::Frontend::Engine.routes.draw do
  root to: 'base#index'

  resources :pages, :only => [:show]
end
