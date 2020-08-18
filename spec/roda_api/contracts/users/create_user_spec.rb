# frozen_string_literal: true

RSpec.describe RodaApi::Contracts::Users::CreateUser do
  subject(:contract) { described_class.new.call(params) }

  let(:params) { { email: email } }

  describe 'Success' do
    context 'with valid params' do
      let(:email) { 'valid@email.com' }

      it 'returns valid contract' do
        expect(contract.to_h).to eq(email: email)
        expect(contract).to be_success
      end
    end
  end

  describe 'Failure' do
    context 'without params' do
      let(:params) { {} }

      it 'returns invalid contract' do
        expect(contract.errors.to_h).to eq(email: ['is missing'])
        expect(contract).to be_failure
      end
    end

    context 'with invalid email format' do
      let(:email) { 'invalid_email' }

      it 'returns invalid contract' do
        expect(contract.errors.to_h).to eq(email: ['not a valid email format'])
        expect(contract).to be_failure
      end
    end
  end
end
