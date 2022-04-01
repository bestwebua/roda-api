# frozen_string_literal: true

require 'i18n'
I18n.load_path << Dir["#{File.expand_path('./config/locales')}/*.yml"]

require 'dry-auto_inject'
require 'dry-container'
require 'dry-validation'
require 'dry-transaction'

Dry::Validation.load_extensions(:monads)
