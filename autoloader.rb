# frozen_string_literal: true

require 'date'
require 'pry'
require 'yaml'
require 'faker'

require_relative 'app/errors/presence_error'
require_relative 'app/errors/object_instance_error'
require_relative 'app/errors/positive_value_error'
require_relative 'app/errors/date_error'
require_relative 'app/services/validator'
require_relative 'app/services/library_seeds'

require_relative 'app/models/author'
require_relative 'app/models/book'
require_relative 'app/models/order'
require_relative 'app/models/reader'
require_relative 'app/models/library'
