class Student < ActiveRecord::Base
  has_many :students_cohorts
  has_many :cohorts, through: :students_cohorts
end