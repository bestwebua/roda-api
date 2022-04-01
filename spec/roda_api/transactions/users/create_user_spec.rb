# frozen_string_literal: true

RSpec.describe RodaApi::Transactions::Users::CreateUser do
  subject(:transaction) { described_class.new.call(params) }

  let(:users_repo) { RodaApi::Repos::Users.new }

  describe 'Success' do
    let(:email) { 'some@email.com' }
    let(:params) { { email: } }

    it 'creates new user' do
      expect { transaction }.to change { users_repo.all.size }.from(0).to(1)
      expect(users_repo.all.last.email).to eq(email)
      expect(transaction).to be_success
    end
  end

  describe 'Failure' do
    context 'when invalid params' do
      let(:params) { {} }

      it 'not creates new user' do
        expect(users_repo.all.size).to be_zero
        expect(transaction).to be_failure
      end
    end
  end
end
