# frozen_string_literal: true

class Book
  include Validator

  attr_reader :title, :author

  def initialize(title, author)
    validate title, author
    @title = title
    @author = author
  end

  def book_data
    "#{title}, author: #{author.author_data}"
  end

  private

  def validate(title, author)
    validate_presence(title: title)
    validate_object(String, title: title)
    validate_object(Author, author: author)
  end
end
