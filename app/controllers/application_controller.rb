class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :matches_integer

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def matches_integer
    %r{\d+}
  end

  def authorize!
    unless logged_in?
      redirect_to login_path
    end
  end

  before_action :authorize!
end
