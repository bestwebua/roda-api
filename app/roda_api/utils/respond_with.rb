# frozen_string_literal: true

module RodaApi
  module Utils
    module RespondWith
      def respond_with(http_status, object, serializer = RodaApi::Serializers::Error)
        status(http_status)
        body(serializer.new(object).serialized_json)
        mime_type(:json)
      end
    end
  end
end
