# frozen_string_literal: true

require_relative '../services/uploader'
require_relative '../services/seeds'

module Entities
  class Library
    include Services::Uploader

    def initialize
      data = load || {}
      @authors = data[:authors] || []
      @books = data[:books] || []
      @readers = data[:readers] || []
      @orders = data[:orders] || []
    end

    def add(entities)
      entities.each do |entity|
        case entity
        when Author then @authors.push entity
        when Book then @books.push entity
        when Reader then @readers.push entity
        when Order then @orders.push entity
        else raise ObjectError, entity
        end
      end
    end

    def save_data
      data = {
        authors: @authors,
        books: @books,
        readers: @readers,
        orders: @orders
      }
      save(data)
    end

    def top_readers(number = 1)
      popular(number, :reader)
    end

    def popular_books(number = 1)
      popular(number, :book)
    end

    def number_readers_popular_books(number = 3)
      @orders.select { |order| popular_books(number).include? order.book }.map(&:reader).uniq.size
    end

    private

    def popular(number, entity)
      @orders.group_by(&entity).max_by(number) { |_, orders| orders.size }.map(&:first)
    end
  end
end

library = Entities::Library.new
Services::Seeds.new(library).call
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
