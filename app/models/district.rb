class District < ActiveRecord::Base
	has_many :users
	has_many :items
	before_save {self.contact_email = contact_email.downcase }
	validates :title, presence: true, length: { minimum: 8, maximum: 80 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :contact_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
	validates :contact_phone, presence: true, length: {minimum: 10, maximum: 10 }
	validates :contact_person, presence: true, length: { minimum: 3, maximum: 50 }

end

