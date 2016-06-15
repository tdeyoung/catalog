class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.text :title
      t.text :contact_person
      t.text :contact_phone
      t.text :contact_email

      t.timestamps null: false
    end
  end
end
