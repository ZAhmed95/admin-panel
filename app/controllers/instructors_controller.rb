class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all.order(:last_name)
  end

  def new
    @instructor = Instructor.new
    render 'form'
  end

  def create
    instructor = Instructor.create(instructor_params)
    if instructor.valid?
      redirect_to instructors_path
    else
      flash[:alert] = "Could not create new instructor."
      instructor.errors.messages.each do |key, value|
        flash[:alert] = value[0]
      end
      redirect_to new_instructor_path
    end
  end

  def show
    @instructor = find_instructor_or_redirect
    @cohorts = @instructor.cohorts
  end

  def edit
    @instructor = find_instructor_or_redirect
    @editing = true
    render 'form'
  end
  
  def update
    @instructor = find_instructor_or_redirect
    if @instructor.update(instructor_params)
      flash[:success] = "Successfully edited instructor."
      redirect_to instructor_path(@instructor)
    else
      flash[:alert] = "Failed to edit instructor."
      redirect_to edit_instructor_path(@instructor)
    end
  end

  def destroy
    @instructor = (find_instructor_or_redirect or return)
    @instructor.destroy
    respond_to do |format|
      format.html { redirect_to instructors_path }
      format.js
    end
  end

  private
  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :age, :salary, :highest_level_of_education)
  end
end
