# frozen_string_literal: true

require_relative './config/system/loader'

if System::Environment.development?
  System::Loader.boot_and_track_changes
  run ->(env) { RodaApi::Application.call(env) }
else
  System::Loader.boot
  run RodaApi::Application.freeze.app
end
