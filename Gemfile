# frozen_string_literal: true

source 'https://rubygems.org'

ruby(File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip[/-(.+)/, 1])

gem 'rake', '~> 13.0', '>= 13.0.1'
gem 'roda', '~> 3.33'
gem 'zeitwerk', '~> 2.3'

group :development, :test do
  gem 'dotenv', '~> 2.7', '>= 2.7.5'
  gem 'pry-byebug', '~> 3.9'
  gem 'rspec-roda', '~> 0.2.2'

  # Code quality
  gem 'bundler-audit', '~> 0.7.0.1', require: false
  gem 'fasterer', '~> 0.8.3', require: false
  gem 'overcommit', '~> 0.54.0', require: false
  gem 'reek', '~> 6.0', '>= 6.0.1', require: false
  gem 'rubocop', '~> 0.87.1', require: false
  gem 'rubocop-performance', '~> 1.6', '>= 1.6.1', require: false
  gem 'rubocop-rspec', '~> 1.40', require: false
end

group :development do
  gem 'listen', '~> 3.2', '>= 3.2.1'
end

group :test do
  gem 'json_matchers', '~> 0.11.1', require: false
  gem 'simplecov', '~> 0.17.1', require: false
end
