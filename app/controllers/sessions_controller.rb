class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:session][:email])
     if @user && @user.authenticate(params[:session][:password])
     	
      session[:user_id]=@user.id
      flash[:success]="welcome to rails"
     redirect_to event_path
  else
  	flash[:danger]="email or password is incorrect"
  	render 'new'
    end

  end

  def destroy
  	session[:user_id]=nil
  	flash[:success]="Loggedout"
    redirect_to root_path
  end
end
