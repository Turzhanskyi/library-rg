# frozen_string_literal: true

class ObjectInstanceError < ArgumentError
  def initialize(object, klass)
    super("#{object.class} isn't object of #{klass}")
  end
end
