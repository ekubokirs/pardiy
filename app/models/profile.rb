class Profile < ActiveRecord::Base
	validates :birthdate, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :bio, presence: true
	
end
