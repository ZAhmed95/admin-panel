class SessionsController < ApplicationController
  skip_before_action :authenticate!
  def new
    render 'new'
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to main_path
    else
      flash[:alert] = "Incorrect username or password."
      p "login failed"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You have been successfully logged out."
    redirect_to login_path
  end
end
