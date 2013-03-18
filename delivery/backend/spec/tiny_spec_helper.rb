$LOAD_PATH.push File.expand_path('../../app', __FILE__)
%w(presenters conductors).each do |pattern|
  $LOAD_PATH.push File.expand_path("../../app/#{pattern}", __FILE__)
end

unless ENV['TRAVIS']
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
  end
end

require 'abc-core'
