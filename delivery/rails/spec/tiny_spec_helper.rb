$:.push File.expand_path('../../../../core', __FILE__)
$:.push File.expand_path('../../app', __FILE__)

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

