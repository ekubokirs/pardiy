class PasswordMailer < ActionMailer::Base
  # Set the default "from" line for these emails
  default from: "no-reply@pardiy.com"

  # Create the password reset email and pass it
  def reset_email(user)
    @user = user
    
    mail to: @user.email, subject: "Change your ParDIY credentials"
  end

  def new_email(user)
    @user = user
    
    mail to: @user.email, subject: "Create your ParDIY credentials"
  end
end