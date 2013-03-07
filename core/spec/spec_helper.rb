%w(entities relators).each {|dir| $:.push File.join(File.dirname(__FILE__), '..', 'abc', dir) }

require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end
