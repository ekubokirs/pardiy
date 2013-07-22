class SessionController < ApplicationController
  def new
  end

  def create
  	if params[:password].blank?
      user = User.find_by(email: params[:email])

      if user
        user.code = SecureRandom.urlsafe_base64
        user.expires_at = Time.now + 2. hours
        user.save
      end
    else
      user = User.authenitcate(params[:email], params[:password])

      if user
        session[:user_id] = user.user_id
        redirect_to root_url
      end
      render :new
    end
  end
  
  def destroy
  	session[:user_id] = nil
  	redirect_to login_url
  end
end
