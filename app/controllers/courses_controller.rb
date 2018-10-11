class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    render 'form'
  end

  def create
    data = params.require(:course).permit(:course_name, :total_hours)
    course = Course.create(data)
    if course.valid?
      redirect_to courses_path
    else
      flash[:alert] = "Could not create new course."
      course.errors.messages.each do |key, value|
        flash[:alert] = value[0]
      end
      redirect_to new_course_path
    end
  end

  def show
    @course = find_course_or_redirect
    @cohorts = @course.cohorts
  end

  def edit
    @course = find_course_or_redirect
    @editing = true
    render 'form'
  end
  
  def update
    @course = find_course_or_redirect
    data = params.require(:course).permit(:course_name, :total_hours)
    if @course.update(data)
      flash[:success] = "Successfully edited course."
      redirect_to course_path(@course)
    else
      flash[:alert] = "Failed to edit course."
      redirect_to edit_course_path(@course)
    end
  end

  def destroy
    @course = (find_course_or_redirect or return)
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_path }
      format.js
    end
  end
end
