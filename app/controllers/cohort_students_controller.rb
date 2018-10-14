class CohortStudentsController < ApplicationController
  def index
    @cohort = find_cohort_or_redirect
    @students = @cohort.students.order(:last_name)
  end

  def new
    @cohort = find_cohort_or_redirect
  end

  def create
    # assign selected students to cohort
    @cohort = (find_cohort_or_redirect or return)
    # get the submitted student ids, excluding the first index, which is blank
    student_ids = params[:cohort][:student_ids][1..-1]
    students = Student.where(id: student_ids)
    count = students.count
    if count > 0
      @cohort.students << students
      flash[:success] = "Added #{count} students to the cohort."
      redirect_to students_in_cohort_path(@cohort)
    else
      flash[:alert] = "Select at least one student to add, or cancel."
      redirect_to add_students_to_cohort_path(@cohort)
    end
  end

  def destroy
    @cohort = (find_cohort_or_redirect(id_key: :cohort_id) or return)
    @student = @cohort.students.find_by_id(params[:student_id])
    if @student
      @cohort.students.delete(@student)
      respond_to do |format|
        format.js { render 'students/destroy.js.erb' }
      end
    end
  end
end
