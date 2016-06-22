class DistrictTableUpdate < ActiveRecord::Migration
  def change
  	add_column :districts, :email_domain, :string 
  end
end
