class CourseCohortsController < ApplicationController
  def index
    @course = find_course_or_redirect
    @cohorts = @course.cohorts
  end

  def new
    @course = find_course_or_redirect
  end

  def create
    @course = (find_course_or_redirect or return)
    data = params.require(:course).permit(:cohort_name, :start_date, :end_date, :instructor_id, :course_id)
    cohort = @course.cohorts.create(data)
    if cohort.valid?
      redirect_to cohorts_in_course_path(@course)
    else
      flash[:alert] = "Could not create new cohort."
      cohort.errors.messages.each do |key, value|
        flash[:alert] = value[0]
      end
      redirect_to new_cohort_in_course_path(@course)
    end
  end
end
