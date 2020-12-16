# frozen_string_literal: true

module Validator
  def validate_presence(**args)
    args.each do |key, value|
      raise PresenceError, "#{self.class}'s #{key} can't be empty" if value.to_s.strip.empty?
    end
  end

  def validate_object(class_obj, **objects)
    objects.each do |key, value|
      unless value.instance_of? class_obj
        raise ObjectInstanceError, "#{self.class}'s #{key} is not an instance of #{class_obj}"
      end
    end
  end

  def validate_positive_value(value)
    raise PositiveValueError, "#{value} should be positive number" if value.to_i.negative?
  end

  def validate_date(date)
    raise DateError, 'Date should be today' if date > Date.today
  end
end
