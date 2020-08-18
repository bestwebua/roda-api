# frozen_string_literal: true

module RodaApi
  class Application < Roda
    include RodaApi::Utils::RespondWith
    include System::Import[transaction: 'transactions.users.create_user']

    plugin :sinatra_helpers

    route do |r|
      r.on 'users' do
        r.is 'create' do
          r.post do
            transaction.call(r.params) do |monad|
              monad.success do |user|
                respond_with(201, user, RodaApi::Serializers::User)
              end

              monad.failure do |contract|
                respond_with(422, contract.errors.to_h)
              end
            end
          end
        end
      end
    end
  end
end
