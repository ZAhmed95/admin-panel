class Student < ActiveRecord::Base
  has_many :students_cohorts
  has_many :cohorts, through: :students_cohorts

  validates_presence_of :first_name, :last_name, message: "First and last name cannot be empty."
  validates_presence_of :age, message: "Age cannot be empty."
  validates_presence_of :highest_level_of_education, message: "Must select highest completed education."
  validates :age, numericality: {
    only_integer: true,
    less_than: 150,
    message: "Age must be an integer less than 150."
  }
  validates :highest_level_of_education, inclusion: {in: ['hs', 'college', 'masters', 'phd']}
end