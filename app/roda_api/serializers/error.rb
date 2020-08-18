# frozen_string_literal: true

module RodaApi
  module Serializers
    class Error
      def initialize(object)
        @object = object
      end

      def serialized_json
        object.to_json
      end

      private

      attr_reader :object
    end
  end
end
