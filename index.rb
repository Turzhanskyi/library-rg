# frozen_string_literal: true

require_relative 'autoloader'

puts '*** Welcome to our library! ***'

library = Library.new
library_seeds = LibrarySeeds.new(library)

puts 'What would you like to do?'
puts "-- Type '1' generate seeds to the library."
puts "-- Type '2' add new author to the library."
puts "-- Type '3' add new book to the library."
puts "-- Type '4' add new reader to the library."
puts "-- Type '5' make an order."
puts "-- Type '6' display statistic."

choice = gets.chomp

case choice
when '1'
  library_seeds.add_library_seeds
  puts 'New data generated to the library'
when '2'
  puts "Enter the author's name and surname"
  name = gets.chomp
  puts 'Add his biography'
  biography = gets.chomp
  library.add_author(name, biography)
  puts 'The author has been added to the library'
when '3'
  puts 'Enter a title for the book'
  title = gets.chomp
  puts "Enter the author's ID"
  author_id = gets.chomp.to_i - 1
  library.add_book(title, author_id)
  puts 'The book has been added to the library'
when '4'
  puts "Enter the reader's first and last name"
  name = gets.chomp
  puts 'Add email'
  email = gets.chomp
  puts 'The city where the reader lives'
  city = gets.chomp
  puts 'Street name'
  street = gets.chomp
  puts 'House number'
  house = gets.chomp
  library.add_reader(name, email, city, street, house)
  puts 'The reader has been added to the library'
when '5'
  puts "Enter the book's ID"
  book_id = gets.chomp.to_i - 1
  puts "Enter the reader's ID"
  reader_id = gets.chomp.to_i - 1
  library.add_order(book_id, reader_id)
  puts 'Order accepted'
when '6'
  puts 'Our statistic:'
  puts '----------------------------------------------------------------------'
  puts '1. Top Readers.'
  library.top_readers.each { |object| puts object.reader_data }
  puts '----------------------------------------------------------------------'
  puts '2. Most Popular Books.'
  library.popular_books.each { |object| puts object.book_data }
  puts '----------------------------------------------------------------------'
  puts '3. Number of readers of the Most Popular Books.'
  puts "Number of readers: #{library.number_readers_popular_books}"
else
  puts "Sorry, I didn't understand you."
end
