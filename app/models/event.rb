class Event < ActiveRecord::Base
	validates :title, presence: true
	validates :venue, presence: true
	validates :event_type, presence: true



	belongs_to :user

	has_many :supplies
	has_many :chores

	require 'open-uri'
	require 'json'

	def get_recipes
		# recipe not finished
		recipes_json = open("http://food2fork.com/api/search?key=8325696c6a6bf0ba5bbffd05deb1aff6&q=" +"birthday")

		recipes = JSON.parse(recipes_json)

		
	end

end
