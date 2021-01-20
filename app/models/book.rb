# frozen_string_literal: true

class Book
  include Validator

  def initialize(title, author)
    validate title, author
    @title = title
    @author = author
  end

  def book_data
    "#{title}, author: #{author.author_data}"
  end

  private

  attr_reader :title, :author

  def validate(title, author)
    validate_presence?(title: title)
    validate_object?(title, String)
    validate_object?(author, Author)
  end
end
