class CreateStudentsCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :students_cohorts do |t|
      t.references :student, index: true
      t.references :cohort, index: true
    end
  end
end
