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

ActiveRecord::Schema.define(version: 20180928152956) do

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
    t.integer "assistant_id"
    t.datetime "signed_in"
    t.integer "is_resolved"
    t.integer "type_student"
    t.integer "sanction"
    t.integer "school_group_id"
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

  create_table "patient_appointments", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "companion"
    t.integer "medical_referral"
    t.integer "nursing_conduct"
    t.text "previous_medical_consultation"
    t.integer "complaints"
    t.text "description_complaint"
    t.string "weight"
    t.string "height"
    t.string "abdominal_perimeter"
    t.string "bloodvpressure"
    t.string "temperature"
    t.string "heart_rate"
    t.string "respiratory_frequency"
    t.string "blood_glucose"
    t.integer "tanners_stage"
    t.text "diagnosis"
    t.text "prescription"
    t.text "evolution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_appointments_on_patient_id"
  end

  create_table "patient_habits", force: :cascade do |t|
    t.bigint "patient_id"
    t.integer "sleep_rest"
    t.integer "amount_sleep_hours"
    t.integer "physical_activity"
    t.integer "amount_physical_activity"
    t.integer "amount_fruit_vegetable"
    t.integer "amount_red_meat"
    t.integer "amount_white_meat"
    t.integer "amount_juice"
    t.integer "amount_water"
    t.integer "amount_tea"
    t.text "other_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_habits_on_patient_id"
  end

  create_table "patient_morbids", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "pre_existing_diseases_vascular_accident"
    t.string "pre_existing_diseases_cancer"
    t.string "pre_existing_diseases_hypertension"
    t.integer "pre_existing_diseases_cardiopathy"
    t.integer "pre_existing_diseases_diabetes"
    t.integer "pre_existing_diseases_renal"
    t.integer "pre_existing_diseases_pneumopathy"
    t.text "others_pre_existing_diseases"
    t.string "allergies_drugs"
    t.string "allergies_foods"
    t.string "allergies_cosmetics"
    t.string "allergies_plaster"
    t.string "allergies_wool"
    t.text "others_allergies"
    t.string "risk_factors_smoking"
    t.string "risk_factors_ethicism"
    t.string "risk_factors_chemotherapy"
    t.string "risk_factors_radiotherapy"
    t.string "risk_factors_chemical_dependency"
    t.string "risk_factors_violence"
    t.text "others_risk_factors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_morbids_on_patient_id"
  end

  create_table "patient_physiologicals", force: :cascade do |t|
    t.bigint "patient_id"
    t.text "other_diseases"
    t.text "continuing_medication"
    t.text "previous_surgeries"
    t.text "hospitalization"
    t.text "first_menstruation"
    t.text "complaints"
    t.text "gestation"
    t.text "children"
    t.text "abortion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_physiologicals_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_patients_on_student_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "entity"
    t.boolean "can_create", default: false
    t.boolean "can_read", default: false
    t.boolean "can_update", default: false
    t.boolean "can_destroy", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "can_manage", default: false
    t.boolean "can_extras", default: false
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_positions_on_name"
  end

  create_table "school_groups", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_school_groups_on_identifier"
    t.index ["name"], name: "index_school_groups_on_name"
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
    t.string "responsible"
    t.string "responsible_contact"
    t.string "contact"
    t.integer "ra"
    t.string "password"
    t.string "password_digest"
    t.string "enrollment"
    t.string "cpf"
    t.date "birth_date"
    t.integer "course_situation"
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
    t.bigint "position_id"
    t.string "avatar"
    t.bigint "course_id"
    t.boolean "admin", default: false
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["position_id"], name: "index_users_on_position_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sector_id"], name: "index_users_on_sector_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "incidents", "courses"
  add_foreign_key "incidents", "students"
  add_foreign_key "incidents", "users"
  add_foreign_key "patient_appointments", "patients"
  add_foreign_key "patient_habits", "patients"
  add_foreign_key "patient_morbids", "patients"
  add_foreign_key "patient_physiologicals", "patients"
  add_foreign_key "patients", "students"
  add_foreign_key "permissions", "users"
  add_foreign_key "students", "courses"
  add_foreign_key "users", "courses"
  add_foreign_key "users", "positions"
  add_foreign_key "users", "sectors"
end
