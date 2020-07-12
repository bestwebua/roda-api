# frozen_string_literal: true

module SystemLoaderHelpers
  def fixtures_path(dir_name)
    File.expand_path("../../support/fixtures/test_classes/#{dir_name}", File.dirname(__FILE__))
  end

  def compose_file_name(file_path)
    "#{file_path[/\A(.+)\/([^\/]+)\z/, 2]}.rb"
  end

  def fixtures_to_load
    fixtures_path(:to_load)
  end

  def created_fixtures
    fixtures_path(:created)
  end

  def updated_fixtures
    fixtures_path(:updated)
  end

  def copy_from(location)
    Dir.glob("#{location}/*").each do |file|
      FileUtils.cp(file, "#{fixtures_to_load}/#{compose_file_name(file)}")
    end
  end

  def copy_fixtures_to_target_path
    copy_from(created_fixtures)
  end

  def update_fixtures_in_target_path
    sleep 0.2
    copy_from(updated_fixtures)
    sleep 0.2
  end

  def clear_fixtures_in_target_path
    Dir.glob("#{fixtures_to_load}/*").each { |file| FileUtils.rm_rf(file) }
  end

  def reload_system_loader!
    Zeitwerk::Registry.loaders.each(&:unload)
    Zeitwerk::Registry.loaders.clear
    System.send(:remove_const, :Loader)
    load 'config/system/loader.rb'
  end
end
