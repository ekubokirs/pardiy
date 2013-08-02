class Event < ActiveRecord::Base
	validates :title, presence: true
	validates :venue, presence: true
	validates :event_type, presence: true



	belongs_to :user

	has_many :supplies
	accepts_nested_attributes_for :supplies
	has_many :chores
	accepts_nested_attributes_for :chores

	require 'open-uri'
	require 'json'

	def get_recipes
		type = self.event_type.downcase
		type = URI::encode(type)

		api_url = "http://www.recipepuppy.com/api/?q=" + type

		data = open(api_url).read

		JSON.parse(data)["results"]
	end

	def edit_supply
		self.supplies.find id
	end

end
