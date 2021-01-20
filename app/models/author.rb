# frozen_string_literal: true

class Author
  include Validator

  def initialize(name, biography = 'No biography provided')
    validate name
    @name = name
    @biography = biography
  end

  def author_data
    "#{@name}. \n Short biography of the author: #{@biography}"
  end

  private

  attr_reader :name, :biography

  def validate(name)
    validate_presence?(name: name)
    validate_object?(name, String)
  end
end
