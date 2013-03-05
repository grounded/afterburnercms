require 'abc/engine'

Rails.application.routes.draw do
  mount Abc::Engine => '/'
end
