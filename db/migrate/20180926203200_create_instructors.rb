class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table "instructors", force: :cascade do |t|
      t.text "first_name", null: false
      t.text "last_name", null: false
      t.integer "age", null: false
      t.integer "salary", null: false
      t.text "highest_level_of_education", null: false
      t.references :user
    end
  end
end
