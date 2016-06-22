class RenameItemColumn < ActiveRecord::Migration
  def change
  	rename_column :items, :composer_lname, :composer_name
  end
end
