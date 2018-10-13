class Instructor < ActiveRecord::Base
  has_many :cohorts

  validates_presence_of :first_name, :last_name, message: "First and last name cannot be empty."
  validates_presence_of :age, message: "Age cannot be empty."
  validates_presence_of :highest_level_of_education, message: "Must select highest completed education."
  validates :age, numericality: {
    only_integer: true,
    less_than: 150,
    message: "Age must be an integer less than 150."
  }
  validates :salary, numericality: {
    only_integer: true,
    greater_than: 0,
    message: "Salary must be a positive integer."
  }
  validates :highest_level_of_education, inclusion: {in: ['hs', 'college', 'masters', 'phd']}
end