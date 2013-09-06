class CreateCaches < ActiveRecord::Migration
  def change
    create_table :caches do |t|

      t.timestamps
    end
  end
end
