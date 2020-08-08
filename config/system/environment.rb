# frozen_string_literal: true

module System
  module Environment
    class << self
      def current_env
        @current_env ||= ENV['RACK_ENV'] || 'development'
      end

      %w[test development production].each do |env_type|
        define_method(:"#{env_type}?") { current_env.eql?(env_type) }
      end

      def app_absolute_path
        @app_absolute_path ||= File.expand_path('../../app', File.dirname(__FILE__))
      end

      def db
        @db ||= ROM.container(
          ROM::Configuration.new(:sql, ENV['DATABASE_URL']) do |config|
            config.register_relation(RodaApi::Relations::Users)
          end
        )
      end
    end
  end
end
