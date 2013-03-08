require 'abc/backend/engine'

Rails.application.routes.draw do
  mount Abc::Backend::Engine => '/'
end
