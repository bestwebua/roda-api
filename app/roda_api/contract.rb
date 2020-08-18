# frozen_string_literal: true

module RodaApi
  class Contract < Dry::Validation::Contract
    config.messages.default_locale = :en
    config.messages.top_namespace = :contract
    config.messages.backend = :i18n
  end
end
