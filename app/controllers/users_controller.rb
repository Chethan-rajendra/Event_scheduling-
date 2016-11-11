class UsersController < ApplicationController
    def index
  @user = User.all
  end

  def new
  @user = User.new
  end

  def create
  	@user = User.new(user_params)
    @user.save
   redirect_to login_path 
  end

 private
  def user_params
  	params.require(:user).permit(:first_name,:last_name,:user_name,:email,:phone_number,:password,:password_confirmation)
  end
  
end
