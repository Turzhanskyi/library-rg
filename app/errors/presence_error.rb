# frozen_string_literal: true

class PresenceError < ArgumentError
  def initialize(key)
    super("#{key} can't be empty")
  end
end
