class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :title
      t.text :composer_fname
      t.text :composer_lname
      t.text :arranger
      t.text :publisher
      t.integer :ensemble
      t.text :level
      t.text :location
      t.text :comments

      t.timestamps null: false
    end
  end
end
