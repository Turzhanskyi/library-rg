# frozen_string_literal: true

class Library
  include Uploader

  def initialize
    data = load
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
      else raise ObjectError
      end
    end
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

  def popular(number, method)
    @orders.group_by(&method).max_by(number) { |_, orders| orders.size }.map(&:first)
  end
end
