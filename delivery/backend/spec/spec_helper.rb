require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

require 'bundler/setup'

Bundler.require :default, :test

require 'capybara/rspec'

Combustion.initialize! :action_view, :active_model, :action_controller
require 'rspec/rails'
