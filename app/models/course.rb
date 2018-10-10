class Course < ActiveRecord::Base
  has_many :cohorts, dependent: :delete_all
  validates_presence_of :course_name, message: 'Course name cannot be empty.'
  validates_presence_of :total_hours, message: 'Total hours cannot be empty.'
end