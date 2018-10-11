# TODO: make this controller work
class CohortStudentsController < ApplicationController
  def index
    @cohort = find_cohort_or_redirect
    @students = @cohort.students
  end

  def new
    @cohort = find_cohort_or_redirect
  end

  def assign
    # assign selected students to cohort
    @cohort = (find_cohort_or_redirect or return)
    if student.valid?
      redirect_to students_in_cohort_path(cohort)
    else
      flash[:alert] = "Could not create new student."
      student.errors.messages.each do |key, value|
        flash[:alert] = value[0]
      end
      redirect_to new_student_in_cohort_path(cohort)
    end
  end
end
