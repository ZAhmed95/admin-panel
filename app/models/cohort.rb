class Cohort < ActiveRecord::Base
  belongs_to :course
  belongs_to :instructor, optional: true
  has_many :students_cohorts
  has_many :students, through: :students_cohorts

  validates_presence_of :cohort_name, message: "Cohort name cannot be empty."
  validates_presence_of :start_date, message: "Start date cannot be empty."
  validates_presence_of :end_date, message: "End date cannot be empty."
  validates_presence_of :course_id, message: "Cohort must belong to a course"
end