$LOAD_PATH.push File.expand_path('../../', __FILE__)

unless ENV['TRAVIS']
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec/"
  end
end
