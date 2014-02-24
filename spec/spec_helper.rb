require 'bundler/setup'
Bundler.setup
require 'seedfile'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

ActiveRecord::Migration.create_table :cars do |t|
  t.string :brand
  t.string :model
  t.integer :year
  t.decimal :price
  t.timestamps
end

RSpec.configure do |config|
  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end
end
