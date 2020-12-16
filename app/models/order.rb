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

  def order_data
    "The order made by #{reader} contains a #{book}.
    \n The date of the order is #{date.strftime('%d.%m.%Y')}"
  end

  private

  def validate(book, reader, date)
    validate_date(date)
    validate_object(Date, date: date)
    validate_object(Book, book: book)
    validate_object(Reader, reader: reader)
  end
end
