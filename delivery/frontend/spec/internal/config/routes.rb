require 'abc/frontend/engine'

Rails.application.routes.draw do
  mount Abc::Frontend::Engine => '/'
end
