class Item < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 3, maximum: 80}
	validates :composer_name, presence: true
	validates :location, presence: true

	enum ensemble: [:band, :choir, :general_music, :orchestra, :other]

	def self.search(search)
	  where('title LIKE :search OR composer_name LIKE :search', search: "%#{search}")

	  #where("title LIKE ?", "%#{search}%") 
	  #where("composer_name LIKE ?", "%#{search}%")
	  #where("ensemble LIKE ?", "%#{search}%")
	  #where("location LIKE ?", "%#{search}%")
	end
end


