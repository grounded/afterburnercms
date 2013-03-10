require File.expand_path('../lib/abc/package', File.dirname(__FILE__))

this_dir = File.dirname(__FILE__)

YARD::Templates::Engine.register_template_path(this_dir + '/templates')

Dir[this_dir + '/handlers/*.rb'].each do |file|
  require File.expand_path(file)
end
YARD::Parser::SourceParser.parser_type = :ruby19
