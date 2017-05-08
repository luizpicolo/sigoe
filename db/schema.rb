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

ActiveRecord::Schema.define(version: 20170508162819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "initial"
    t.index ["name", "initial"], name: "index_courses_on_name_and_initial", using: :btree
  end

  create_table "keypasses", force: :cascade do |t|
    t.string   "title"
    t.string   "key"
    t.string   "local_service"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "user"
    t.integer  "local"
    t.index ["title"], name: "index_keypasses_on_title", using: :btree
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.string   "initial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.string   "icon"
    t.index ["name", "initial", "slug"], name: "index_sectors_on_name_and_initial_and_slug", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_id"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_students_on_course_id", using: :btree
    t.index ["name"], name: "index_students_on_name", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "from"
    t.string   "to"
    t.string   "subject"
    t.integer  "priority",    default: 0
    t.text     "description"
    t.integer  "status",      default: 0
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "local"
    t.integer  "answer"
    t.index ["from"], name: "index_tickets_on_from", using: :btree
    t.index ["status"], name: "index_tickets_on_status", using: :btree
    t.index ["to"], name: "index_tickets_on_to", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username",               default: "", null: false
    t.string   "name"
    t.integer  "siape"
    t.integer  "sector_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["sector_id"], name: "index_users_on_sector_id", using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "students", "courses"
  add_foreign_key "tickets", "users"
  add_foreign_key "users", "sectors"
end
