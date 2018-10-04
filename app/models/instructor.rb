class Instructor < ActiveRecord::Base
  has_many :cohorts
end