# Maintain your gem's version:
require File.expand_path('../lib/abc/package', File.dirname(__FILE__))

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "abc-adapters"
  s.version     = Abc::VERSION
  s.authors     = Abc::AUTHORS
  s.email       = Abc::EMAILS
  s.homepage    = Abc::HOMEPAGE
  s.summary     = Abc::SUMMARY
  s.description = Abc::DESCRIPTION

  s.require_paths = ["lib"]

  s.files = `git ls-files`.split($/)
  s.test_files = s.files.grep(%r{^(spec)/})

  s.required_ruby_version = Abc::REQUIRED_RUBY_VERSION

  s.add_dependency 'abc-core', "~> #{Abc::VERSION}"
  s.add_dependency 'hyperion-api'
end
