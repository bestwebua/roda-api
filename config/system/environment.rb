# frozen_string_literal: true

module System
  module Environment
    class << self
      %w[test development production].each do |env_type|
        define_method(:"#{env_type}?") { ENV['RACK_ENV'].eql?(env_type) }
      end

      def app_absolute_path
        @app_absolute_path ||= File.expand_path('../../app', File.dirname(__FILE__))
      end
    end
  end
end
