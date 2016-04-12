class Item < ActiveRecord::Base
	enum ensemble: [:band, :choir, :general_music, :orchestra, :other]
end
