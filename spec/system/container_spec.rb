# frozen_string_literal: true

RSpec.describe System::Container do
  it { expect(System).to be_const_defined(:Import) }

  describe 'injected dependencies' do
    let(:dummy_class_instance) do
      DummyClass = Class.new do # rubocop:disable Lint/ConstantDefinitionInBlock, RSpec/LeakyConstantDeclaration
        include System::Import[
          contract: 'contracts.users.create_user',
          repository: 'repos.users',
          transaction: 'transactions.users.create_user'
        ]
      end.new
    end

    it 'has dependencies' do
      expect(dummy_class_instance.repository).to be_an_instance_of(RodaApi::Repos::Users)
      expect(dummy_class_instance.contract).to be_an_instance_of(RodaApi::Contracts::Users::CreateUser)
      expect(dummy_class_instance.transaction).to be_an_instance_of(RodaApi::Transactions::Users::CreateUser)
    end
  end
end
