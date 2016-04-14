class RenameFnameColumn < ActiveRecord::Migration
  def change
  	rename_column :users, :fname, :name
  end
end
