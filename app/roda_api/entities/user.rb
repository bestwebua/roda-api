# frozen_string_literal: true

module RodaApi
  module Entities
    class User < ROM::Struct
      def email_domain
        email[/.+@(.+)/, 1]
      end
    end
  end
end
