# frozen_string_literal: true

module RodaApi
  module Serializers
    class User < RodaApi::Serializer
      set_type :user

      attributes :email, :created_at, :updated_at
    end
  end
end
