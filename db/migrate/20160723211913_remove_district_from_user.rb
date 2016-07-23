class RemoveDistrictFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :district, :text
  end
end
