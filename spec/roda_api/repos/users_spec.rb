# frozen_string_literal: true

RSpec.describe RodaApi::Repos::Users do
  let(:repo) { described_class.new }
  let(:email) { 'some@email.com' }

  describe '#create' do
    subject(:user) { repo.create(email: email) }

    it 'creates a user' do
      expect { user }.to change { repo.all.size }.from(0).to(1)
      expect(user).to be_a(RodaApi::Entities::User)
      expect(user.id).not_to be_nil
      expect(user.email).to eq(email)
      expect(user.created_at).not_to be_nil
      expect(user.updated_at).not_to be_nil
    end
  end

  describe '#all' do
    subject(:users) { repo.all }

    it 'returns users collection' do
      repo.create(email: email)
      expect(users).to be_an_instance_of(Array)
    end
  end
end
