class SessionsController < ApplicationController
  skip_before_action :authorize!
  def new
    # TODO: make pretty
    render 'new', layout: false
  end

  def create
    user = User.find_by_email(params[:email])
    p user
    if user && user.password_digest == params[:password]
      session[:user_id] = user.id
      redirect_to main_path
    else
      flash[:alert] = "Incorrect username or password."
      p "login failed"
      redirect_to login_path
    end
  end

  def destroy
  end
end
