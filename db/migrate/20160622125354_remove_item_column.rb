class RemoveItemColumn < ActiveRecord::Migration
  def change
  	remove_column :items, :composer_fname, :text
  end
end
