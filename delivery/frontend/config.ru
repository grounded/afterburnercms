require 'bundler'

Bundler.require :default, :development, :assets

Combustion.initialize! :action_view, :active_model, :action_controller, :sprockets
run Combustion::Application
