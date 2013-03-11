$LOAD_PATH.push File.expand_path('../../../core', __FILE__)
$LOAD_PATH.push File.expand_path('../../', __FILE__)
require 'pry'
require 'pry-nav'
require 'abc-adapters'

require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end
