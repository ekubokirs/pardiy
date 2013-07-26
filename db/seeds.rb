# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

users = User.create([
	{
		email: "tluu@gmail.com", 
		password: "123", 
		password_confirmation:"123", 
		code: "1234123412341234123"
	},
	{
		email: "emilia@gmail.com", 
		password: "abc", 
		password_confirmation: "abc", 
		code: "123asdf234123asdf3"
	}
])