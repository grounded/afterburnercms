$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "afterburnercms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = "afterburnercms"
  gem.version     = Afterburnercms::VERSION
  gem.authors     = ["TODO: Your name"]
  gem.email       = ["TODO: Your email"]
  gem.homepage    = "TODO"
  gem.summary     = "TODO: Summary of Afterburnercmgem."
  gem.description = "TODO: Description of Afterburnercmgem."

  gem.require_paths = ["lib"]

  gem.files = `git ls-files`.split($/)
  gem.test_files = gem.files.grep(%r{^(spec)/})
end
