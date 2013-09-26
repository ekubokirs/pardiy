class PasswordController < ApplicationController
 def edit
    # find the user with the passed in code
    @user = User.find_by(code: params[:code])

    # display the reset password form
    unless @user and @user.expires_at < Time.now
      redirect_to login_url, alert: "Reset link has expired. Please try again. Edit."
    end
  end

  def update
    # Find the user with the unique reset code
    @user = User.find_by(code: params[:user][:code])
    
    # If the user exists and the code has not expired
    if @user and @user.expires_at < Time.now
      # do the password update and set the code
      @user.update_attributes(user_params)
      @user.code = nil
      # expiry to null (expire the reset page)
      @user.expires_at = nil
      
      if @user.save
        # Password update was successful, log the user in and
        session[:user_id] = @user.id
        # redirect to the home page
        redirect_to root_url, notice: "Password changed successfully."
      
      else
        # Password update failed, redirect to the login page
        redirect_to login_url, alert: "Reset link has expired. Please try again."
      end
    else
      # User not found or code expired, redirect to the login page
      redirect_to login_url, alert: "User not found. Please try again."
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :password,
      :password_confirmation,
      :code,
      :expires_at
    )
  end
end