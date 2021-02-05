# frozen_string_literal: true

require_relative '../services/validator'

module Entities
  class Book
    include Services::Validator

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
      validate_presence?(title: title)
      validate_object?(title, String)
      validate_object?(author, Author)
    end
  end
end
