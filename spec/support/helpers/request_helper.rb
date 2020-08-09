# frozen_string_literal: true

module RequestHelpers
  def app
    RodaApi::Application
  end

  def response
    last_response
  end

  def resource_type(response)
    body = JSON.parse(response.body)
    dig_params = body['data'].is_a?(Array) ? ['data', 0, 'type'] : %w[data type]
    body.dig(*dig_params)
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include RequestHelpers
end
