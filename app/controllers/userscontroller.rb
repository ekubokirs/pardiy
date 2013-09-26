class UsersController < ApplicationController

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.create user_params

    if @user
      redirect_to root_url, status: 303
    else
      render :new
    end
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes(user_params)
      redirect_to users_path, status: 303
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
