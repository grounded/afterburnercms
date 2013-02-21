source "http://rubygems.org"

gemspec

git 'git://github.com/rails/rails.git' do
  gem 'railties'
  gem 'actionpack'
  gem 'activemodel'
end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'capybara'
  gem 'combustion', github: 'pat/combustion'
  gem 'sqlite3'
  gem 'pry'
end

group :development do
  gem 'yard', "~> 0.8.4.1"
  gem 'rdoc'
  gem 'kramdown'
end
