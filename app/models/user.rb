class User < ActiveRecord::Base
	belongs_to :district
	has_many :items
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
	has_secure_password
	#validates :password, presence: true, length: { minimum: 6 }

	searchable do 	
		string :name
		string :email
		integer :district_id
	end	

end
