# frozen_string_literal: true

require_relative 'app/config/autoloader'

authors = []
books = []
readers = []
orders = []

15.times do
  authors.push Author.new(FFaker::Book.author, FFaker::Book.description)
end
27.times { books.push Book.new(FFaker::Book.title, authors[rand(0..14)]) }
68.times do
  readers.push Reader.new(FFaker::Name.name,
                          FFaker::Internet.email,
                          FFaker::Address.city,
                          FFaker::Address.street_name,
                          rand(1..95))
end
100.times { orders.push Order.new(books[rand(0..26)], readers[rand(0..67)]) }

library = Library.new
library.add(authors)
library.add(books)
library.add(readers)
library.add(orders)
library.save(authors: authors, books: books, readers: readers, orders: orders)

puts '*** Welcome to library! ***'
puts 'Our statistic:'
puts '----------------------------------------------------------------------'
puts '1. Top Readers:'
library.top_readers(4).each { |object| puts object.reader_data }
puts '----------------------------------------------------------------------'
puts '2. Most Popular Books:'
library.popular_books(2).each { |object| puts object.book_data }
puts '----------------------------------------------------------------------'
puts "3. Number of readers of the Most Popular Books: #{library.number_readers_popular_books}"
