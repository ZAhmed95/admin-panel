class CohortsController < ApplicationController
  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
    render_form_with_model(@cohort)
  end

  def show
    @cohort = find_cohort_or_redirect
    @course = @cohort.course
    @instructor = @cohort.instructor
    @students = @cohort.students
  end

  def edit
    @cohort = find_cohort_or_redirect
    @editing = true
    render_form_with_model(@cohort)
  end
  
  def update
    @cohort = find_cohort_or_redirect
    if @cohort.update(cohort_params)
      flash[:success] = "Successfully edited cohort."
      redirect_to cohort_path(@cohort)
    else
      flash[:alert] = "Failed to edit cohort."
      redirect_to edit_cohort_path(@cohort)
    end
  end

  def destroy
    @cohort = (find_cohort_or_redirect or return)
    @cohort.destroy
    respond_to do |format|
      format.html { redirect_to cohorts_path }
      format.js
    end
  end

  def cohort_params
    params.require(:cohort).permit(:cohort_name, :start_date, :end_date, :course_id, :instructor_id)
  end
end
