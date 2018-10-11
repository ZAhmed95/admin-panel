class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def find_course_or_redirect(options={})
    id = params[:id]
    course = Course.find_by_id(id)
    unless course
      # if something went wrong, choose appropriate action
      flash[:alert] = "Course with id #{id} doesn't exist."
      respond_to do |format|
        format.html { redirect_to(options[:redirect] || courses_path) }
        format.js { render 'courses/redirect.js.erb' }
        format.json { {error: "Course with id #{id} doesn't exist."}.to_json }
      end and return false
    end
    course
  end

  def find_cohort_or_redirect
    id = params[:id]
    cohort = Cohort.includes(:course, :instructor, :students).find_by_id(id)
    unless cohort
      # if something went wrong, choose appropriate action
      flash[:alert] = "Cohort with id #{id} doesn't exist."
      respond_to do |format|
        format.html { redirect_to cohorts_path }
        format.js { render 'cohorts/redirect.js.erb' }
        format.json { {error: "Cohort with id #{id} doesn't exist."}.to_json }
      end and return false
    end
    cohort
  end

  def authorize!
    unless logged_in?
      redirect_to login_path
    end
  end

  before_action :authorize!
end
