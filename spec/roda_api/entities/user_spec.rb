# frozen_string_literal: true

RSpec.describe RodaApi::Entities::User do
  let(:user_repo) { RodaApi::Repos::User.new }

  it { expect(described_class).to be < ROM::Struct }

  describe '#email' do
    it 'returns user email domain' do
      domain = 'email.com'
      user = user_repo.create(email: "some@#{domain}")
      expect(user.email_domain).to eq(domain)
    end
  end
end
