class StudentsController < ApplicationController
  def index
    @students = Student.all.order(:last_name)
  end

  def new
    @student = Student.new
    render 'form'
  end

  def create
    student = Student.create(student_params)
    if student.valid?
      redirect_to students_path
    else
      flash[:alert] = "Could not create new student."
      student.errors.messages.each do |key, value|
        flash[:alert] = value[0]
      end
      redirect_to new_student_path
    end
  end

  def show
    @student = find_student_or_redirect
  end

  def edit
    @student = find_student_or_redirect
    @editing = true
    render 'form'
  end
  
  def update
    @student = find_student_or_redirect
    if @student.update(student_params)
      flash[:success] = "Successfully edited student."
      redirect_to student_path(@student)
    else
      flash[:alert] = "Failed to edit student."
      redirect_to edit_student_path(@student)
    end
  end

  def destroy
    @student = (find_student_or_redirect or return)
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_path }
      format.js
    end
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :age, :highest_level_of_education)
  end
end
