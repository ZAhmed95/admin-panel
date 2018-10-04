# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_10_04_212425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.text "cohort_name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.integer "instructor_id"
  end

  create_table "courses", force: :cascade do |t|
    t.text "course_name", null: false
    t.integer "total_hours", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.integer "age", null: false
    t.integer "salary", null: false
    t.text "highest_level_of_education", null: false
  end

  create_table "students", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.integer "age", null: false
    t.text "highest_level_of_education", null: false
  end

  create_table "students_cohorts", force: :cascade do |t|
    t.bigint "students_id"
    t.bigint "cohorts_id"
    t.index ["cohorts_id"], name: "index_students_cohorts_on_cohorts_id"
    t.index ["students_id"], name: "index_students_cohorts_on_students_id"
  end

  add_foreign_key "cohorts", "instructors"
end
