%w(entities interactors).each do |dir|
  $:.push File.join(File.dirname(__FILE__), '..', 'abc', dir)
end

require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end
