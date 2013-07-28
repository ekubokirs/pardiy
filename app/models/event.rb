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
		type = self.event_type.downcase

		api_url = "http://www.recipepuppy.com/api/?q=" + type

		data = open(api_url).read

		datahash = JSON.parse(data)

		puts api_url

		puts datahash	
	end

end
