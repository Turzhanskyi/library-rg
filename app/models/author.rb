# frozen_string_literal: true

class Author
  include Validator
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
    validate_presence(name: name)
    validate_object(String, name: name)
  end
end
