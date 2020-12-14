# frozen_string_literal: true

class LibrarySeeds
  def initialize(library)
    @library = library
  end

  def add_authors(quantity)
    quantity.times do
      author = Faker::Book.unique.author
      biography = Faker::Lorem.sentence(word_count: 10)
      @library.add_author(author, biography)
    end
  end

  def add_books(quantity)
    quantity.times do
      author_id = rand(1..15)
      book = Faker::Book.unique.title
      @library.add_book(author_id, book)
    end
  end

  def add_readers(quantity)
    quantity.times do
      name = Faker::Name.name
      email = Faker::Internet.unique.email
      city = Faker::Address.city
      street = Faker::Address.street_name
      house = rand(1..25)
      @library.add_reader(name, email, city, street, house)
    end
  end

  def add_orders(quantity)
    quantity.times do
      book_id = rand(1..20)
      reader_id = rand(1..18)
      @library.add_order(book_id, reader_id)
    end
  end

  def add_library_seeds
    add_authors(15)
    add_books(20)
    add_readers(18)
    add_orders(40)
  end
end
