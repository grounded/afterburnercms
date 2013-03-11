$LOAD_PATH.push File.expand_path('../../abc/', __FILE__)

require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

require 'abc-adapters'
