# frozen_string_literal: true

class Reader
  include Validator
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    validate name, email, city, street, house
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def reader_data
    "Reader #{name} live in #{city} on #{street}, #{house}. Email: #{email}"
  end

  private

  def validate(name, email, city, street, house)
    validate_presence(name: name, email: email, city: city, street: street, house: house)
    validate_positive_value(house)
    validate_object(Integer, house: house)
  end
end
