# frozen_string_literal: true

module Uploader
  STORE = 'library_data.yml'

  def load
    File.file?(STORE) ? YAML.load_file(STORE) : {}
  end

  def save(authors:, books:, readers:, orders:)
    store = YAML::Store.new STORE
    store.transaction do
      store['authors'] = authors
      store['books'] = books
      store['readers'] = readers
      store['orders'] = orders
    end
  end
end
