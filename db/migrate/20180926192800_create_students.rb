class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.text :first_name
      t.text :last_name
      t.integer :age
      t.text :highest_level_of_education
      t.integer :cohort_id
    end
  end
end
