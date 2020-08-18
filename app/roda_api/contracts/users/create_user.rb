# frozen_string_literal: true

module RodaApi
  module Contracts
    module Users
      class CreateUser < RodaApi::Contract
        register_macro(:email_format) do
          key.failure(:email_format) unless /\A.+@.+\z/.match?(value)
        end

        params do
          required(:email).filled(:string)
        end

        rule(:email).validate(:email_format)
      end
    end
  end
end
