# frozen_string_literal: true

class Library
  def initialize(authors: [], books: [], orders: [], readers: [])
    @authors = authors
    @books = books
    @orders = orders
    @readers = readers
  end

  private

  attr_reader :authors, :books, :readers, :orders
end
