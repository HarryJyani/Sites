require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.create(chefname: "bob", email: "bob@example.com")
		@recipe = @chef.recipes.new(name: "chicken parm",summary: "This is a surpise kind of a recipe", description: "Just add several things together and you will get what you need")
	end
	
	test "Recipe should be valid" do
		assert @recipe.valid?
	end
	test "Chef_Id should be there" do
		@recipe.chef_id = nil
		assert_not @recipe.valid?
	end
	test "name should be present" do
		@recipe.name = ""
		assert_not @recipe.valid?
	end
	
	test "name not too long" do
		@recipe.name = "a"*101
		assert_not @recipe.valid?
	end
	
	test "name not too short" do
		@recipe.name = "aaaa"
		assert_not @recipe.valid?
	end
	
	test "summary must be present" do
		@recipe.summary = ""
		assert_not @recipe.valid?
	end
	
	test "summary not too long" do
		@recipe.summary = "a"*151
		assert_not @recipe.valid?
	end
	
	test "summary not too short" do
		@recipe.summary = "a"*9
		assert_not @recipe.valid?
	end
	
	test "description must be there" do
		@recipe.description = ""
		assert_not @recipe.valid?
	end
	
	test "description not too long" do
		@recipe.description = "a"*501
		assert_not @recipe.valid?
	end
	
	test "description not too short" do
		@recipe.description = "a"*19
		assert_not @recipe.valid?
	end
	
end