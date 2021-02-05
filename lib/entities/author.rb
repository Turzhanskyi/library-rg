# frozen_string_literal: true

require_relative '../services/validator'

module Entities
  class Author
    include Services::Validator

    attr_reader :name, :biography

    def initialize(name, biography = 'No biography provided')
      validate name
      @name = name
      @biography = biography
    end

    def author_data
      "#{@name}. \n Short biography of the author: #{@biography}"
    end

    private

    def validate(name)
      validate_presence?(name: name)
      validate_object?(name, String)
    end
  end
end
