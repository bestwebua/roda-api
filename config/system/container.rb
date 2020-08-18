# frozen_string_literal: true

module System
  class Container
    extend Dry::Container::Mixin

    namespace 'repos' do
      register 'users' do
        RodaApi::Repos::Users.new
      end
    end

    namespace 'contracts' do
      namespace 'users' do
        register 'create_user' do
          RodaApi::Contracts::Users::CreateUser.new
        end
      end
    end

    namespace 'transactions' do
      namespace 'users' do
        register 'create_user' do
          RodaApi::Transactions::Users::CreateUser.new
        end
      end
    end
  end

  Import = Dry::AutoInject(System::Container)
end
