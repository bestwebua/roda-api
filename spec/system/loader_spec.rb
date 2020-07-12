# frozen_string_literal: true

RSpec.describe 'System::Loader' do
  describe '.boot_and_track_changes' do
    after { clear_fixtures_in_target_path }

    context 'when development environment' do
      before do
        allow(System::Environment).to receive(:development?).and_return(true)
        allow(System::Environment).to receive(:app_absolute_path).and_return(fixtures_to_load)
        copy_fixtures_to_target_path
        reload_system_loader!
      end

      it 'reloads consts from application absolute path' do
        System::Loader.boot_and_track_changes
        update_fixtures_in_target_path
        expect(TestModule.test_method).to eq('42')
      end
    end

    context 'when not development environment' do
      before do
        allow(System::Environment).to receive(:development?).and_return(false)
        allow(System::Environment).to receive(:app_absolute_path).and_return(fixtures_to_load)
        copy_fixtures_to_target_path
        reload_system_loader!
      end

      it 'not loads consts from application absolute path' do
        expect(System::Loader.boot_and_track_changes).to be_nil
        expect { TestModule }.to raise_error(NameError)
      end
    end
  end
end
