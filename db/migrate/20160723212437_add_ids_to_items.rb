class AddIdsToItems < ActiveRecord::Migration
  def change
  	add_column :items, :user_id, :integer
  	add_column :items, :district_id, :integer
  end
end
