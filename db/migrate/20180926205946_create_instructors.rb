class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.text :first_name
      t.text :last_name
      t.integer :age
      t.money :salary
      t.text :highest_completed_education
    end
  end
end
