# frozen_string_literal: true

require_relative 'autoloader'

authors = []
books = []
readers = []
orders = []

authors.push Author.new(name: 'Author_1')
authors.push Author.new(name: 'Author_2')

books.push Book.new(title: 'Book_1', author: authors[0])
books.push Book.new(title: 'Book_2', author: authors[1])

readers.push Reader.new(name: 'Reader_1', email: 'reader_1@gmail.com', city: 'City_1',
                        street: 'Street_1', house: 1)
readers.push Reader.new(name: 'Reader_2', email: 'reader_2@gmail.com', city: 'City_2',
                        street: 'Street_2', house: 2)

orders.push Order.new(book: books[0], reader: readers[0])
orders.push Order.new(book: books[1], reader: readers[1])

my_library = Library.new(authors: authors, books: books, readers: readers, orders: orders)

authors.each { |author| puts author.author_data }
books.each { |book| puts book.book_data }
readers.each { |reader| puts reader.reader_data }
orders.each { |order| puts order.order_data }

puts my_library
