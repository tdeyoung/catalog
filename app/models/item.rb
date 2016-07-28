class Item < ActiveRecord::Base
	belongs_to :district
	belongs_to :user
	validates :title, presence: true, length: {minimum: 3, maximum: 80}
	validates :composer_name, presence: true
	validates :location, presence: true

	enum ensemble: [:band, :choir, :general_music, :orchestra, :other]

	searchable do 
		text :title, :composer_name, :arranger, :publisher, :level, :location

		integer :ensemble
		integer :status
		integer :user_id
		integer :district_id

		string :sort_title do
			title.downcase.gsub(/^(an?|the)/, '')
		end
	end	
end


