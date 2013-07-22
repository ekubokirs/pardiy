class SessionController < ApplicationController
  def new
  end

  def create
  	puts params[:password]
    if params[:password].blank?
      user = User.find_by(email: params[:email])

      if user
        user.code = SecureRandom.urlsafe_base64
        user.expires_at = Time.now + 2. hours
        user.save

        PasswordMailer.reset_email(user).deliver
      end
      
    render :new

    else
      user = User.authenticate(params[:email], params[:password])

      puts user
      if user
        session[:user_id] = user.id
        redirect_to root_url, alert: "You've Logged In!" and return
      end
      render :new and return
    end
  end
  
  def destroy
  	session[:user_id] = nil
  	redirect_to login_url
  end
end
