# frozen_string_literal: true

module RodaApi
  module Transactions
    module Users
      class CreateUser < RodaApi::Transaction
        include System::Import[
          contract: 'contracts.users.create_user',
          repository: 'repos.users'
        ]

        step :validate
        step :persist

        def validate(params)
          contract.call(params).to_monad
        end

        def persist(result)
          Success(repository.create(result.values))
        end
      end
    end
  end
end
