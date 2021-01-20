# frozen_string_literal: true

module Seeds
  def seeds_generate
    authors = []
    books = []
    readers = []
    orders = []

    authors_generate(authors)
    books_generate(books, authors)
    readers_generate(readers)
    orders_generate(orders, books, readers)

    save(authors: authors, books: books, readers: readers, orders: orders)
  end

  def authors_generate(authors)
    15.times do
      authors.push Author.new(FFaker::Book.author, FFaker::Book.description)
    end
    add(authors)
  end

  def books_generate(books, authors)
    27.times { books.push Book.new(FFaker::Book.title, authors[rand(0..14)]) }
    add(books)
  end

  def readers_generate(readers)
    68.times do
      readers.push Reader.new(FFaker::Name.name,
                              FFaker::Internet.email,
                              FFaker::Address.city,
                              FFaker::Address.street_name,
                              rand(1..95))
    end
    add(readers)
  end

  def orders_generate(orders, books, readers)
    100.times { orders.push Order.new(books[rand(0..26)], readers[rand(0..67)]) }
    add(orders)
  end
end
