# frozen_string_literal: true

module Validator
  def validate_presence?(options = {})
    raise PresenceError, options.keys if options.values.map { |value| value.to_s.strip.empty? }.all?
  end

  def validate_object?(object, klass)
    raise ObjectInstanceError.new(object, klass) unless object.instance_of?(klass)
  end

  def validate_positive_value?(value)
    raise PositiveValueError, value unless value.to_i.positive?
  end
end
