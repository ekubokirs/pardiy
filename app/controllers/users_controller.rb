class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def new
    # if params[:id]
      @user = User.find_by_code params[:code]
      @profile = Profile.new

    # else
    #   redirect_to root_path
    # end
    
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.create user_params

    if @user
      redirect_to users_path, status: 303
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

  def destroy
    user = User.find params[:id]
    user.destroy

    redirect_to users_path, status: 303
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def profile_params
    params.require(:profile).permit(:birthdate, :city, :state, :bio)
  end

end
