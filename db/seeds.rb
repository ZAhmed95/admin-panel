# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

p 'Creating seed courses'
Course.create(
  course_name: "Introduction to C++",
  total_hours: 200
)
Course.create(
  course_name: "Introduction to Java",
  total_hours: 230
)
Course.create(
  course_name: "Introduction to Python",
  total_hours: 215
)

p "Creating admin user"
admin = User.create(
  email: 'a',
  password_digest: 'a'
)

p "Creating seed instructors"
Instructor.create(
  first_name: 'John',
  last_name: 'Doe',
  age: 40,
  salary: 80000,
  highest_level_of_education: 'phd'
)
