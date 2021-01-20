# frozen_string_literal: true

require 'date'
require 'yaml/store'
require 'ffaker'

require_relative '../errors/presence_error'
require_relative '../errors/object_instance_error'
require_relative '../errors/positive_value_error'
require_relative '../errors/object_error'
require_relative '../services/uploader'
require_relative '../services/validator'
require_relative '../services/seeds'

require_relative '../models/author'
require_relative '../models/book'
require_relative '../models/order'
require_relative '../models/reader'
require_relative '../models/library'
