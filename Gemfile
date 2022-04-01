# frozen_string_literal: true

source 'https://rubygems.org'

ruby(File.read(File.join(File.dirname(__FILE__), '.ruby-version')).strip[/-(.+)/, 1])

gem 'dotenv', '~> 2.7', '>= 2.7.6'
gem 'dry-auto_inject', '~> 0.9.0'
gem 'dry-container', '~> 0.9.0'
gem 'dry-transaction', '0.13.3'
gem 'dry-validation', '~> 1.8'
gem 'fast_jsonapi', '~> 1.5'
gem 'i18n', '~> 1.10'
gem 'pg', '~> 1.3', '>= 1.3.5'
gem 'rake', '~> 13.0', '>= 13.0.6'
gem 'roda', '~> 3.54'
gem 'rom', '~> 5.2', '>= 5.2.6'
gem 'rom-repository', '~> 5.2', '>= 5.2.2'
gem 'rom-sql', '~> 3.5'
gem 'zeitwerk', '~> 2.5', '>= 2.5.4'

group :development, :test do
  gem 'pry-byebug', '~> 3.9'
  gem 'rspec-roda', '~> 0.2.2'

  # Code quality
  gem 'bundler-audit', '~> 0.9.0.1', require: false
  gem 'fasterer', '~> 0.9.0', require: false
  gem 'overcommit', '~> 0.58.0', require: false
  gem 'reek', '~> 6.1', require: false
  gem 'rubocop', '~> 1.26', '>= 1.26.1', require: false
  gem 'rubocop-performance', '~> 1.13', '>= 1.13.3', require: false
  gem 'rubocop-rspec', '~> 2.9', require: false
end

group :development do
  gem 'listen', '~> 3.7', '>= 3.7.1'
end

group :test do
  gem 'database_cleaner-sequel', '~> 2.0', '>= 2.0.2', require: false
  gem 'json_matchers', '~> 0.11.1', require: false
  gem 'rack-test', '~> 1.1', require: false
  gem 'simplecov', '~> 0.21.2', require: false
  gem 'simplecov-lcov', '~> 0.8.0', require: false
  gem 'undercover', '~> 0.4.4', require: false
end
