# frozen_string_literal: true

require_relative 'app/config/autoloader'

library = Library.new
LibrarySeeds.new(library).call
library.save_data

puts '*** Welcome to library! ***'
puts 'Our statistic:'
puts '----------------------------------------------------------------------'
puts '1. Top Readers:'
library.top_readers(5).each { |object| puts object.reader_data }
puts '----------------------------------------------------------------------'
puts '2. Most Popular Books:'
library.popular_books(4).each { |object| puts object.book_data }
puts '----------------------------------------------------------------------'
puts "3. Number of readers of the Most Popular Books: #{library.number_readers_popular_books}"
