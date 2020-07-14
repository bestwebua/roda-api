# frozen_string_literal: true

module RodaApi
  module Repos
    class User < ROM::Repository[:users]
      def self.new(container: System::Environment.db)
        super
      end

      struct_namespace RodaApi::Entities

      commands(
        :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i[created_at updated_at]
          }
        }
      )

      def all
        users.to_a
      end
    end
  end
end
