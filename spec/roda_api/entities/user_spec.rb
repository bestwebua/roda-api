# frozen_string_literal: true

RSpec.describe RodaApi::Entities::User do
  let(:users_repo) { RodaApi::Repos::Users.new }

  it { expect(described_class).to be < ROM::Struct }

  describe '#email' do
    it 'returns user email domain' do
      domain = 'email.com'
      user = users_repo.create(email: "some@#{domain}")
      expect(user.email_domain).to eq(domain)
    end
  end
end
