class User < ActiveRecord::Base
	#encrypts password using definition at bottom before saving info in database
	before_save :encrypt_password

	attr_accessor :password, :password_confirmation

	validates :password, confirmation: true
	validates :password_confirmation, presence: true, unless: "password.nil?"

	def self.authenticate(email, password)
		# find user by email
		user = User.find_by(email: email)
		if user
			# runs the entered password through the salt
			fish = BCrypt::Engine.hash_secret(password, user.salt)
			
			# if the password entered gets passed through the salt and returned as the same, the user is true
			if user.fish == fish
				return user
			end

		end
		
		nil
	end

	private

	# encrypts password so it is never stored as entered
	def encrypt_password

		self.salt = BCrypt::Engine.generate_salt
		self.fish = BCrypt::Engine.hash_secret(self.password, self.salt)

	end
end
