# Maintain your gem's version:
require File.expand_path('../lib/abc/version', __FILE__)

rails_version = '>= 4.0.0.beta'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "abc"
  s.version     = Abc::VERSION
  s.authors     = ["Rob Yurkowski"]
  s.email       = ["rob@yurkowski.net"]
  s.homepage    = ""
  s.summary     = "An Abecedarium."
  s.description = "An Abecedarium."

  s.require_paths = ["lib"]

  s.files = `git ls-files`.split($/)
  s.test_files = s.files.grep(%r{^(spec)/})

  s.required_ruby_version = '>= 1.9.3' # that's right.

  s.add_dependency 'railties',      rails_version
  s.add_dependency 'activesupport', rails_version
  s.add_dependency 'actionpack',    rails_version
  s.add_dependency 'activemodel',   rails_version
end
