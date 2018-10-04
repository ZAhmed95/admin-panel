class AddChecksToStudents < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        # add check: age must be less than 150
        execute <<~SQL
        ALTER TABLE students
        ADD CONSTRAINT students_age_constraint
        CHECK (
          age < 150
        )
        SQL

        # add check: education must be one of hs, college, masters, phd
        execute <<~SQL
        ALTER TABLE students
        ADD CONSTRAINT students_education_level_constraint
        CHECK (
          highest_level_of_education IN ('hs', 'college', 'masters', 'phd')
        )
        SQL
      end

      dir.down do
        execute <<~SQL
        ALTER TABLE students DROP CONSTRAINT students_education_level_constraint
        SQL
        execute <<~SQL
        ALTER TABLE students DROP CONSTRAINT students_age_constraint
        SQL
      end
    end
  end
end
