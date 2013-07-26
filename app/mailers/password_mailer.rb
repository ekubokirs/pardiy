class PasswordMailer < ActionMailer::Base
  # Set the default "from" line for these emails
  default from: "no-reply@pardiy.com"

  # Create the password reset email and pass it
  def reset_email(user)
    @user = user
    
    mail to: @user.email, subject: "Change your ParDIY credentials"
  end

  # Create new user email and pass it
  def registration_email(user)
    @user = user
    
    mail to: @user.email, subject: "Create your ParDIY credentials"
  end
end