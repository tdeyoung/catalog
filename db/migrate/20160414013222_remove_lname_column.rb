class RemoveLnameColumn < ActiveRecord::Migration
  def change
  	remove_column :users, :lname, :text
  end
end
