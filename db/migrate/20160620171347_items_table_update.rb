class ItemsTableUpdate < ActiveRecord::Migration
  def change
  	add_column :items, :status, :integer
  end
end
