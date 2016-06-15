require 'test_helper'

class DistrictTest < ActiveSupport::TestCase

	def setup
		@district = District.new(title: "Example Public Schools", contact_person: "Example Jones",
		 contact_phone: "6165551234", contact_email: "bill@example.com")
	end

	test "should be vaild" do 
		assert @district.valid?
	end
		
	test "title must be present" do
		@district.title = ""
		assert_not @district.valid?
	end

	test "title must not be too short" do
		@district.title = "a" * 7
		assert_not @district.valid?
	end

	test "title must not be too long" do
		@district.title = "a" * 81
		assert_not @district.valid?
	end

	test "contact_person must be present" do
		@district.contact_person = ""
		assert_not @district.valid?
	end

	test "contact_person must not be too short" do
		@district.contact_person = "aa"
		assert_not @district.valid?
	end

	test "contact_person must not be too long" do
		@district.contact_person = "a" * 51
		assert_not @district.valid?
	end

	test "contact_phone must be present" do
		@district.contact_phone = ""
		assert_not @district.valid?
	end

	test "contact_phone must not be too short" do
		@district.contact_phone = "a" * 9
		assert_not @district.valid?
	end

	test "contact_phone must not be too long" do
		@district.contact_phone = "a" * 11
		assert_not @district.valid?
	end

	test "contact_email must be present" do
		@district.contact_email = ""
		assert_not @district.valid?
	end

	  test "contact_email should not be too long" do
    @district.contact_email = "a" * 244 + "@example.com"
    assert_not @district.valid?
  end

  test "contact_email validation should accept valid addressess" do
    valid_addresses = %w[ user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn ]
    valid_addresses.each do |valid_address|
      @district.contact_email = valid_address
      assert @district.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "contact_email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @district.contact_email = invalid_address
      assert_not @district.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

end
