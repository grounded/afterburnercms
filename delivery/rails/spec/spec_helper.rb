require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

require 'rubygems'
require 'bundler/setup'

Bundler.require :default, :test

require 'capybara/rspec'

Combustion.initialize! :action_view
require 'rspec/rails'
