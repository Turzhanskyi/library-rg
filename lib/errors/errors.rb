# frozen_string_literal: true

module Errors
  class ObjectError < ArgumentError
    def initialize(object)
      super("#{object.class} is wrong object")
    end
  end

  class ObjectInstanceError < ArgumentError
    def initialize(object, klass)
      super("#{object.class} isn't object of #{klass}")
    end
  end

  class PositiveValueError < ArgumentError
    def initialize(value)
      super("#{value} should be positive number")
    end
  end

  class PresenceError < ArgumentError
    def initialize(key)
      super("#{key} can't be empty")
    end
  end
end
