# frozen_string_literal: true

require 'yaml'

module Services
  module Uploader
    STORE = 'library_data.yml'

    def load
      YAML.load_file(STORE) if File.file?(STORE)
    end

    def save(data)
      return if File.file?(STORE)

      File.open(STORE, 'w') { |f| f.write(data.to_yaml) }
    end
  end
end
