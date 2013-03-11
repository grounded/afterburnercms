$LOAD_PATH.push File.expand_path('../../abc/', __FILE__)
require 'abc-adapters'

require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end
