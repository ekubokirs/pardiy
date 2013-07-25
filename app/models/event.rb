class Event < ActiveRecord::Base
	validates :title, presence: true
	validates :venue, presence: true
	validates :event_type, presence: true



	belongs_to :user

	has_many :supplies
	has_many :todo

end
