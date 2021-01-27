# frozen_string_literal: true

class LibrarySeeds
  AUTHORS_COUNT = 15
  BOOKS_COUNT = 27
  READERS_COUNT = 68
  ORDERS_COUNT = 100

  def initialize(library)
    @library = library
  end

  def call
    authors = authors_generate
    @library.add(authors)

    books = books_generate(authors)
    @library.add(books)

    readers = readers_generate
    @library.add(readers)

    orders = orders_generate(books, readers)
    @library.add(orders)
  end

  private

  def authors_generate
    AUTHORS_COUNT.times.collect do
      Author.new(FFaker::Book.author, FFaker::Book.description)
    end
  end

  def books_generate(authors)
    BOOKS_COUNT.times.collect do
      Book.new(FFaker::Book.title, authors.sample)
    end
  end

  def readers_generate
    READERS_COUNT.times.collect do
      Reader.new(FFaker::Name.name,
                 FFaker::Internet.email,
                 FFaker::Address.city,
                 FFaker::Address.street_name,
                 rand(1..95))
    end
  end

  def orders_generate(books, readers)
    ORDERS_COUNT.times.collect do
      Order.new(books.sample, readers.sample)
    end
  end
end
