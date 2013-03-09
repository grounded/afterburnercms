$LOAD_PATH.push File.expand_path('../../../../core', __FILE__)
$LOAD_PATH.push File.expand_path('../../app', __FILE__)
$LOAD_PATH.push File.expand_path('../../app/presenters', __FILE__)
$LOAD_PATH.push File.expand_path('../../app/conductors/abc/frontend', __FILE__)

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

