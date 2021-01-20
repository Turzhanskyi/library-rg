# frozen_string_literal: true

class PositiveValueError < ArgumentError
  def initialize(value)
    super("#{value} should be positive number")
  end
end
