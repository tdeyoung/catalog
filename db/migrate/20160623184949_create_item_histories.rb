class CreateItemHistories < ActiveRecord::Migration
  def change
    create_table :item_histories do |t|
      t.boolean :using
      t.date :last_modified
      t.date :added

      t.timestamps null: false
    end
  end
end
