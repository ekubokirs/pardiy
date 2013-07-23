class SessionController < ApplicationController
  def new
  end

  def create
    #execute this if the password is blank
    if params[:password].blank?
      #find the user by these parameters
      user = User.find_by(email: params[:email])

      if user
        #generate random code
        user.code = SecureRandom.urlsafe_base64
        #the code expires at a certain time from time sent
        user.expires_at = Time.now + 48. hours
        user.save

        #calls mailer/password_mailer.rb to send reset email
        PasswordMailer.reset_email(user).deliver

      else 
        #defines the variavle user as something new
        user = User.new
        user.code = SecureRandom.urlsafe_base64
        user.expires_at = Time.now + 48. hours
        #defines what the user email is for the mailer
        user.email = params[:email]
        user.save

        PasswordMailer.new_email(user).deliver
      end
      
    render :new

    # if there is a password then the following executes
    else
      user = User.authenticate(params[:email], params[:password])

      #logs in user if email and password exist 
      puts user
      if user
        puts 'maybe'
        session[:user_id] = user.id
        redirect_to root_url, alert: "You've Logged In!" and return
      else
        puts 'broken'
      end
      render :new and return
    end
  end
  
  # if there is no session id then the page redirects to the homepage
  def destroy
  	session[:user_id] = nil
  	redirect_to login_url
  end
end
