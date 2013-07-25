class PwSettersController < ApplicationController
	# GET / pw_setters/:code - shows new password set page
	def new 
		@user = User.find_by_code params[:code]
		@user.email = user_params[:email]

	end

	# POST/ pw_setters/:code - shows new password set page
	def create
		render text: params[:pw_setter].inspect
	end

	private

	def user_params
	    params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
