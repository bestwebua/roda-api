# frozen_string_literal: true

RSpec.describe System::Environment do
  describe '.current_env' do
    subject(:current_env) { described_class.current_env }

    it 'returns memoized environment type' do
      current_env
      use_env('other_env')
      expect(current_env).to eq('test')
    end
  end

  describe '.test?' do
    it do
      expect(described_class.test?).to be(true)
    end
  end

  describe '.app_absolute_path' do
    subject(:app_absolute_path) { described_class.app_absolute_path }

    it 'returns memoized application absolute path' do
      expect(app_absolute_path).to be_an_instance_of(String)
      expect(app_absolute_path.object_id).to eq(described_class.app_absolute_path.object_id)
      expect(app_absolute_path).to eq(File.expand_path('../../app', File.dirname(__FILE__)))
    end
  end

  describe '.db' do
    subject(:db) { described_class.db }

    it do
      expect(db).to be_an_instance_of(ROM::Container)
      expect(db.relations).to respond_to(:users)
    end
  end
end
