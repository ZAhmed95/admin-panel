class CourseCohortsController < ApplicationController
  def index
    @course = find_course_or_redirect
    @cohorts = @course.cohorts
  end

  def new
    @course = find_course_or_redirect
  end

  def create
    data = params.require(:cohort).permit(:cohort_name, :start_date, :end_date, :course_id)
    cohort = Cohort.create(data)
    course = cohort.course
    if cohort.valid?
      redirect_to cohorts_in_course_path(course)
    else
      flash[:alert] = "Could not create new cohort."
      cohort.errors.messages.each do |key, value|
        flash[:alert] = value[0]
      end
      redirect_to new_cohort_in_course_path(course)
    end
  end
end
