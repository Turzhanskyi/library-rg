# frozen_string_literal: true

class Library
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
      puts 'Error!'
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

  def add_reader(name, email, city, street, house)
    @readers.push Reader.new(name, email, city, street, house)
    export_library_data
  end

  def add_book(author_id, title)
    @books.push Book.new(@authors[author_id], title)
    export_library_data
  end

  def add_order(book_id, reader_id)
    @orders.push Order.new(@books[book_id], @readers[reader_id])
    export_library_data
  end

  private

  attr_reader :authors, :books, :readers, :orders

  def all_export_data
    { authors: authors, books: books, readers: readers, orders: orders }
  end
end
