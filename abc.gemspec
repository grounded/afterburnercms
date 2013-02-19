# Maintain your gem's version:
require File.expand_path('../lib/abc/version', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "abc"
  s.version     = ABC::VERSION
  s.authors     = ["Rob Yurkowski"]
  s.email       = ["rob@yurkowski.net"]
  s.homepage    = ""
  s.summary     = "An Abecedarium."
  s.description = "An Abecedarium."

  s.require_paths = ["lib"]

  s.files = `git ls-files`.split($/)
  s.test_files = s.files.grep(%r{^(spec)/})

  s.required_ruby_version = '>= 1.9.3' # that's right.

  # you got it, rails 4.
  s.add_dependency 'railties', '>= 4.0.0.beta'
  s.add_dependency 'actionpack', '>= 4.0.0.beta'
  s.add_dependency 'activemodel', '>= 4.0.0.beta'
end
