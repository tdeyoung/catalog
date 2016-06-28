class DropItemHistoryTable < ActiveRecord::Migration
  def change
  	drop_table :item_histories do |t|
  		t.boolean :using
  		t.date :last_modified
  		t.date :added
  		t.timestamps
  	end 
  end
end
