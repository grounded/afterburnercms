%w(entities).each {|dir| $:.push File.join(File.dirname(__FILE__), '..', dir) }

require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end
