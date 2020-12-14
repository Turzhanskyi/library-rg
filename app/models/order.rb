# frozen_string_literal: true

class Order
  attr_reader :book, :reader, :date

  def initialize(book:, reader:, date: Date.today)
    @book = book
    @reader = reader
    @date = date
  end

  def order_data
    "The order made by #{reader} contains a #{book}.
    \n The date of the order is #{date.strftime('%d.%m.%Y')}"
  end
end
