require File.expand_path('../../lib/abc/package', File.dirname(__FILE__))

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "abc-backend"
  s.version     = Abc::VERSION
  s.authors     = Abc::AUTHORS
  s.email       = Abc::EMAILS
  s.homepage    = Abc::HOMEPAGE
  s.summary     = Abc::SUMMARY
  s.description = Abc::DESCRIPTION

  s.require_paths = ["lib"]

  s.files = Dir['app/**/*', 'lib/**/*', 'config/**/*', 'spec/**/*']
  s.test_files = s.files.grep(%r{^(spec)/})

  s.required_ruby_version = '>= 1.9.3' # that's right.

  s.add_dependency 'railties',      Abc::RAILS_VERSION
  s.add_dependency 'activesupport', Abc::RAILS_VERSION
  s.add_dependency 'actionpack',    Abc::RAILS_VERSION
  s.add_dependency 'activemodel',   Abc::RAILS_VERSION
end
