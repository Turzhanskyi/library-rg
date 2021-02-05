# frozen_string_literal: true

require_relative '../errors/errors'

module Services
  module Validator
    def validate_presence?(options = {})
      empty_values = options.values.map { |value| value.to_s.strip.empty? }.all?
      raise Errors::PresenceError, options.keys if empty_values
    end

    def validate_object?(object, klass)
      raise Errors::ObjectInstanceError.new(object, klass) unless object.instance_of?(klass)
    end

    def validate_positive_value?(value)
      raise Errors::PositiveValueError, value unless value.to_i.positive?
    end
  end
end
