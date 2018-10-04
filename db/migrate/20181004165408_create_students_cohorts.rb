class CreateStudentsCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :students_cohorts do |t|
      t.belongs_to :students, index: true
      t.belongs_to :cohorts, index: true
    end
  end
end
