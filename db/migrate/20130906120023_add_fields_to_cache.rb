class AddFieldsToCache < ActiveRecord::Migration
  def change
    add_column :caches, :key, :string
    add_column :caches, :value, :string
    add_column :caches, :expiration, :string
  end
end
