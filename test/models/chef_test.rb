require 'test_helper'

class ChefTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.new(chefname: "john",email: "john@example.com")
	end
	
	test "chef should be valid" do
		assert @chef.valid?
	end
	
	test "chefname should be present" do
		@chef.chefname = ""
		assert_not @chef.valid?
	end
	
	test "chefname not too long" do
		@chef.chefname = "a"*41
		assert_not @chef.valid?
	end
	
	test "chefname not too short" do
		@chef.chefname = "aa"
		assert_not @chef.valid?
	end
	
	test "email should be present" do
		@chef.email = " "
		assert_not @chef.valid?
	end
	
	test "email should be within the bounds" do
		@chef.email = "a"*101 + "@example.com"
		assert_not @chef.valid?
	end
	
	test "email should be unique" do
		dup_chef = @chef.dup
		dup_chef.email = @chef.email.upcase
		@chef.save
		assert_not dup_chef.valid?
	end
	
	test "email validation should accept valid email" do
		valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com]
			valid_addresses.each do |val|
				@chef.email = val
				assert @chef.valid?, "#{val.inspect} should be valid"	
			end
	end
	test "email validation should reject invalid address" do
		invalid_addresses = %w[user@example,com user@example. user@i_am,com]
			invalid_addresses.each do |ia|
				@chef.email = ia
				assert_not @chef.valid? "#{ia.inspect} should be invalid"
			end
	end
	
end