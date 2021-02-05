# frozen_string_literal: true

require 'ffaker'
require_relative '../entities/author'
require_relative '../entities/book'
require_relative '../entities/order'
require_relative '../entities/reader'

module Services
  class Seeds
    AUTHORS_COUNT = 15
    BOOKS_COUNT = 27
    READERS_COUNT = 68
    ORDERS_COUNT = 100

    def initialize(library)
      @library = library
    end

    def call
      library_seeds_generate
    end

    private

    def library_seeds_generate
      authors = authors_generate
      add_seed(authors)

      books = books_generate(authors)
      add_seed(books)

      readers = readers_generate
      add_seed(readers)

      orders = orders_generate(books, readers)
      add_seed(orders)
    end

    def authors_generate
      AUTHORS_COUNT.times.collect do
        Entities::Author.new(FFaker::Book.author, FFaker::Book.description)
      end
    end

    def books_generate(authors)
      BOOKS_COUNT.times.collect do
        Entities::Book.new(FFaker::Book.title, authors.sample)
      end
    end

    def readers_generate
      READERS_COUNT.times.collect do
        Entities::Reader.new(FFaker::Name.name,
                             FFaker::Internet.email,
                             FFaker::Address.city,
                             FFaker::Address.street_name,
                             rand(1..95))
      end
    end

    def orders_generate(books, readers)
      ORDERS_COUNT.times.collect do
        Entities::Order.new(books.sample, readers.sample)
      end
    end

    def add_seed(entity)
      @library.add(entity)
    end
  end
end
