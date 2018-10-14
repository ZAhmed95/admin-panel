class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :education_level_map

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def education_level_map(key)
    {
      'hs' => 'High School',
      'college' => 'College',
      'masters' => 'Masters',
      'phd' => 'PhD'
    }[key]
  end

  def render_form_with_model(model)
    render 'shared/form', locals: {model: model}
  end

  def find_course_or_redirect
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

  def find_cohort_or_redirect(options={})
    id = params[options[:id_key] || :id]
    cohort = Cohort.find_by_id(id)
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

  def find_student_or_redirect
    id = params[:id]
    student = Student.find_by_id(id)
    unless student
      # if something went wrong, choose appropriate action
      flash[:alert] = "Student with id #{id} doesn't exist."
      respond_to do |format|
        format.html { redirect_to students_path }
        format.js { render 'students/redirect.js.erb' }
        format.json { {error: "Student with id #{id} doesn't exist."}.to_json }
      end and return false
    end
    student
  end

  def find_instructor_or_redirect
    id = params[:id]
    instructor = Instructor.find_by_id(id)
    unless instructor
      # if something went wrong, choose appropriate action
      flash[:alert] = "Instructor with id #{id} doesn't exist."
      respond_to do |format|
        format.html { redirect_to instructors_path }
        format.js { render 'instructors/redirect.js.erb' }
        format.json { {error: "Instructor with id #{id} doesn't exist."}.to_json }
      end and return false
    end
    instructor
  end

  private
  def authenticate!
    unless logged_in?
      flash[:alert] = "You must be logged in first."
      redirect_to login_path
    end
  end

  def authorize!
    
  end

  before_action :authenticate!
end
