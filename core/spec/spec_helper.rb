$:.push File.expand_path('../../', __FILE__)

require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end
