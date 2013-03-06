$:.push File.join(File.dirname(__FILE__), '..', 'app')

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

