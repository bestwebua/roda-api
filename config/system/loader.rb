# frozen_string_literal: true

require 'listen'
require 'zeitwerk'
require_relative './environment'

initializers = File.join(File.expand_path('../initializers', File.dirname(__FILE__)), '**/*.rb')
Dir[File.expand_path(initializers)].sort.each { |file| require_relative file }

module System
  class Loader
    class << self
      def boot
        loader.eager_load
      end

      # :nocov:
      def boot_and_track_changes(log: false)
        return unless System::Environment.development?

        boot
        loader.log! if log
        Listen.to(System::Environment.app_absolute_path) { loader.reload }.start
      end
      # :nocov:

      private

      def loader
        @loader ||= new.call
      end
    end

    def initialize
      @loader = Zeitwerk::Loader.new
      @configured = false
    end

    def call
      return loader if configured

      configure_loader
      self.configured = true
      loader
    end

    private

    attr_reader :loader
    attr_accessor :configured

    def configure_loader
      loader.push_dir(System::Environment.app_absolute_path)
      loader.enable_reloading if System::Environment.development?
      loader.setup
    end
  end
end
