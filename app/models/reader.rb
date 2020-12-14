# frozen_string_literal: true

class Reader
  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def reader_data
    "Reader #{name} live in #{city} on #{street}, #{house}. Email: #{email}"
  end
end
