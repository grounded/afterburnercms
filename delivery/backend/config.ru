require 'bundler'

Bundler.require :default, :development

Combustion.initialize! :action_view, :active_model, :action_controller
run Combustion::Application
