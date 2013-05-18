require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
	test "an author should enter a first name" do
		author = Author.new
		assert !author.save
		assert !author.errors[:first_name].empty?
	end

	test "an author should enter a last name" do
		author = Author.new
		assert !author.save
		assert !author.errors[:last_name].empty?
	end

	test "an author should enter a profile name" do
		author = Author.new
		assert !author.save
		assert !author.errors[:profile_name].empty?
	end

	test "an author should have a unique profile name" do
		author = Author.new
		author.profile_name = authors(:david).profile_name

		assert !author.save
		assert !author.errors[:profile_name].empty?
	end

	test "an author should have a profile name without spaces" do
		author = Author.new(first_name: 'David', last_name: 'Simpson', email: 'david2@david-simpson.net')
		author.password = author.password_confirmation = 'asdfasdf'
		
		author.profile_name = "My Profile With Spaces"

		assert !author.save
		assert !author.errors[:profile_name].empty?
		assert author.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "an author can have a correctly formatted profile name" do
		author = Author.new(first_name: 'David', last_name: 'Simpson', email: 'david2@david-simpson.net')
		author.password = author.password_confirmation = 'asdfasdf'

		author.profile_name = 'smpsn_1'
		assert author.valid?
	end

	test "that calling to_param on an author returns the profile_name" do
		assert_equal "smpsn", authors(:david).to_param
	end
end
