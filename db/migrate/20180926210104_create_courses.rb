class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.text :course_name, null: false
      t.integer :total_hours, null: false
    end
  end
end
