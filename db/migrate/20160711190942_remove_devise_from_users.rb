class RemoveDeviseFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :encrypted_password, :string
  	remove_column :users, :reset_password_token, :string
  	remove_column :users, :reset_password_sent_at, :datetime
  	remove_column :users, :remember_created_at, :datetime
  	remove_column :users, :sign_in_count, :integer
  	remove_column :users, :current_sign_in_at, :datetime
  	remove_column :users, :last_sign_in_at, :datetime
  	remove_column :users, :current_sign_in_ip, :string
  	remove_column :users, :last_sign_in_ip, :string
  	remove_column :users, :confirmation_token, :string
  	remove_column :users, :confirmed_at, :datetime
  	remove_column :users, :confirmation_sent_at, :datetime
  	remove_column :users, :unconfirmed_email, :string
  	remove_reference :users, :reset_password_token, index: true, foreign_key: true
  	remove_reference :users, :confirmation_token, index: true, foreign_key: true
  end
end
