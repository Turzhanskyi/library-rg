# frozen_string_literal: true

class Order
  include Validator
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    validate book, reader, date
    @book = book
    @reader = reader
    @date = date
  end

  private

  def validate(book, reader, date)
    validate_object?(book, Book)
    validate_object?(reader, Reader)
    validate_object?(date, Date)
  end
end
