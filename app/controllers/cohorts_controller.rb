class CohortsController < ApplicationController
  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
    render 'form'
  end

  def create
    data = params.require(:cohort).permit(:cohort_name, :total_hours)
    cohort = Cohort.create(data)
    if cohort.valid?
      redirect_to cohorts_path
    else
      flash[:alert] = "Could not create new cohort."
      cohort.errors.messages.each do |key, value|
        flash[:alert] = value[0]
      end
      redirect_to new_cohort_path
    end
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
    render 'form'
  end
  
  def update
    @cohort = find_cohort_or_redirect
    data = params.require(:cohort).permit(:cohort_name, :start_date, :end_date, :course_id)
    if @cohort.update(data)
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
end
