# frozen_string_literal: true

class Library
  include Validator

  STORE = 'library_data.yml'

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
    import_library_data
  end

  def import_library_data(file_name = STORE)
    if File.exist?(file_name)
      data = YAML.load_file(file_name)
      @authors = data[:authors]
      @books = data[:books]
      @readers = data[:readers]
      @orders = data[:orders]
    else
      puts 'Library data is empty)'
    end
  end

  def export_library_data(file_name = STORE)
    File.new(file_name, 'w') unless File.exist?(file_name)
    File.open(file_name, 'w') { |f| f.write(all_export_data.to_yaml) }
  end

  def add_author(name, bio)
    @authors.push Author.new(name, bio)
    export_library_data
  end

  def add_book(title, author_id)
    validate author_id
    @books.push Book.new(title, @authors[author_id])
    export_library_data
  end

  def add_reader(name, email, city, street, house)
    @readers.push Reader.new(name, email, city, street, house)
    export_library_data
  end

  def add_order(book_id, reader_id)
    validate book_id
    validate reader_id
    @orders.push Order.new(@books[book_id], @readers[reader_id])
    export_library_data
  end

  def popular_books(number = 1)
    popular(number, :book)
  end

  def top_readers(number = 1)
    popular(number, :reader)
  end

  def number_readers_popular_books(number = 3)
    @orders.select { |order| popular_books(number).include? order.book }.map(&:reader).uniq.size
  end

  private

  attr_reader :authors, :books, :readers, :orders

  def all_export_data
    { authors: authors, books: books, readers: readers, orders: orders }
  end

  def validate(id)
    validate_positive_value(id)
  end

  def popular(number, method)
    @orders.group_by(&method).max_by(number) { |_, orders| orders.size }.map(&:first)
  end
end
