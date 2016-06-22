require 'test_helper'

class ItemTest < ActiveSupport::TestCase

	def setup
		@item = Item.create(title: "a title goes here", composer_name: "name", 
			ensemble: 1, location: "location")
	end

	test "item must be vaild" do
		assert @item.valid?	
	end

	test "title must be present" do
		@item.title = ""
		assert_not @item.valid?
	end

	test "title must not be too short" do
		@item.title = "aa"
		assert_not @item.valid?
	end

	test "title must not be too long" do
		@item.title = "a" * 81
		assert_not @item.valid?
	end

	test "composer name must be present" do
		@item.composer_name = "" 
		assert_not @item.valid?
	end

	test "ensemble must be valid" do
		invalid_ensembles = [-10, -1, 5, 10]
		invalid_ensembles.each do |is|
			begin
				@item.ensemble = is
				assert false, "#{is} should be invalid"
			rescue
				assert true
			end
		end
	end

	test "location must be present" do
		@item.location = ""
		assert_not @item.valid?
	end

end
