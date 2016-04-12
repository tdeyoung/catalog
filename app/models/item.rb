class Item < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 3, maximum: 80}
	validates :composer_lname, presence: true
	validates :location, presence: true

	enum ensemble: [:band, :choir, :general_music, :orchestra, :other]
end
