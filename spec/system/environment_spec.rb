# frozen_string_literal: true

RSpec.describe System::Environment do
  %w[test development production].each do |env_type|
    method_name = "#{env_type}?"
    describe ".#{method_name}" do
      it do
        ENV['RACK_ENV'] = env_type
        expect(described_class.public_send(method_name)).to be(true)
      end
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
end
