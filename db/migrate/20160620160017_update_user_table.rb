class UpdateUserTable < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.boolean :admin
  		t.text :district
  	end
  end
end
