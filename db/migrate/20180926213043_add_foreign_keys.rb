class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :cohorts, :instructors
  end
end
