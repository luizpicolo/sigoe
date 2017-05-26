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

ActiveRecord::Schema.define(version: 20170526085842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "initial"
    t.index ["name", "initial"], name: "index_courses_on_name_and_initial"
  end

  create_table "incidents", id: :serial, force: :cascade do |t|
    t.integer "student_id"
    t.integer "user_id"
    t.integer "institution"
    t.text "description"
    t.date "date_incident"
    t.text "soluction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.time "time_incident"
    t.index ["course_id"], name: "index_incidents_on_course_id"
    t.index ["date_incident"], name: "index_incidents_on_date_incident"
    t.index ["institution"], name: "index_incidents_on_institution"
    t.index ["student_id"], name: "index_incidents_on_student_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "keypasses", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "key"
    t.string "local_service"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user"
    t.integer "local"
    t.index ["title"], name: "index_keypasses_on_title"
  end

  create_table "sectors", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "initial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "icon"
    t.index ["name", "initial", "slug"], name: "index_sectors_on_name_and_initial_and_slug"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "course_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["name"], name: "index_students_on_name"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", default: "", null: false
    t.string "name"
    t.integer "siape"
    t.integer "sector_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sector_id"], name: "index_users_on_sector_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "incidents", "courses"
  add_foreign_key "incidents", "students"
  add_foreign_key "incidents", "users"
  add_foreign_key "students", "courses"
  add_foreign_key "users", "sectors"
end
