# frozen_string_literal: true

class Reader
  include Validator

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

  attr_reader :name, :email, :city, :street, :house

  def validate(name, email, city, street, house)
    validate_presence?(name: name)
    validate_presence?(email: email)
    validate_presence?(city: city)
    validate_presence?(street: street)
    validate_presence?(house: house)
    validate_object?(house, Integer)
    validate_positive_value?(house)
  end
end
