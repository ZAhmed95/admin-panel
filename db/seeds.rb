# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

# Setup
# set Faker rng, to produce deterministic output every seeding
Faker::Config.random = Random.new(99)
education_level = ['hs', 'college', 'masters', 'phd']

# destroy existing data
p "Deleting existing data"
Student.destroy_all
Instructor.destroy_all
Cohort.destroy_all
Course.destroy_all
User.destroy_all

languages = ["C++", "Java", "JavaScript", "Python", "Ruby"]
hours = [200, 180, 220, 200, 210]

courses = {}

p 'Creating seed courses'
(0...5).each do |i|
  courses[languages[i]] = 
  Course.create!(
    course_name: "Introduction to #{languages[i]}",
    total_hours: hours[i]
  )
end

p "Create 5 cohorts for each course"
courses.each do |language, course|
  (1..5).each do |i|
    start_date = Faker::Date.between(Date.strptime('09/01/2016', '%m/%d/%Y'), Date.strptime('09/30/2016', '%m/%d/%Y'))
    course.cohorts.create!(
      cohort_name: "#{language} Section #{i}",
      start_date: start_date,
      end_date: (start_date >> 3) + 20
    )
  end
end

p "Create 8-12 students for each cohort"
Cohort.all.each do |cohort|
  rand(8..12).times do
    cohort.students.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      age: rand(18..30),
      highest_level_of_education: education_level.sample,
    )
  end
end

p "Creating admin user"
User.create!(
  email: "admin@zia.edu",
  password: "1234"
)

p "Creating seed instructors"
30.times do
  Instructor.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(30..60),
    salary: rand(60..120) * 1000,
    highest_level_of_education: education_level[2..-1].sample
  )
end
