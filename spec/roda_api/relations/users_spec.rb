# frozen_string_literal: true

RSpec.describe RodaApi::Relations::Users do
  let(:user_repo) { RodaApi::Repos::User.new }

  it { expect(described_class).to be < ROM::Relation[:sql] }
  it { expect(System::Environment.db.relations).to respond_to(:users) }
end
