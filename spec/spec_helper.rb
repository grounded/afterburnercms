require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

require 'pry'

require 'rubygems'
require 'bundler'

require 'rails'

Bundler.require :default, :test

require 'capybara/rspec'

require 'abc'
Combustion.initialize!

require 'rspec/rails'
require 'capybara/rails'
