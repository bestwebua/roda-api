# frozen_string_literal: true

module SystemEnvironmentHelpers
  module_function

  def use_env(environment_type)
    ENV['RACK_ENV'] = environment_type.to_s
  end
end
