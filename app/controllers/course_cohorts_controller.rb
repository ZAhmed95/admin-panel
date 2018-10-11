class CourseCohortsController < ApplicationController
  def index
    @course = find_course_or_redirect
    @cohorts = @course.cohorts
  end

  def new
    @course = find_course_or_redirect
    render 'cohorts/form'
  end

  def create

  end
end
