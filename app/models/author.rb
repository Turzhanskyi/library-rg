# frozen_string_literal: true

class Author
  attr_reader :name

  def initialize(name, biography = 'No biography provided')
    @name = name
    @biography = biography
  end

  def author_data
    "#{@name}. \n Short biography of the author: #{@biography}"
  end
end
