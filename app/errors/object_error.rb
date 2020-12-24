# frozen_string_literal: true

class ObjectError < ArgumentError
  def initialize(object)
    super("#{object.class} is wrong object")
  end
end
