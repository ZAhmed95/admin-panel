class AddChecksToCourses < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        # add check: total_hours cannot be less than 0
        execute <<~SQL
        ALTER TABLE courses
        ADD CONSTRAINT courses_total_hours_constraint
        CHECK (
          total_hours >= 0
        )
        SQL
      end

      dir.down do
        execute <<~SQL
        ALTER TABLE courses DROP CONSTRAINT courses_total_hours_constraint
        SQL
      end
    end
  end
end
