# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_24_132224) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "initial"
    t.bigint "polo_id"
    t.index ["name", "initial"], name: "index_courses_on_name_and_initial"
    t.index ["polo_id"], name: "index_courses_on_polo_id"
  end

  create_table "incidents", id: :serial, force: :cascade do |t|
    t.integer "student_id"
    t.integer "user_id"
    t.integer "institution"
    t.text "description"
    t.date "date_incident"
    t.text "soluction"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "course_id"
    t.time "time_incident"
    t.integer "assistant_id"
    t.datetime "signed_in", precision: nil
    t.integer "is_resolved"
    t.integer "type_student"
    t.integer "sanction"
    t.integer "school_group_id"
    t.bigint "type_incident_id"
    t.bigint "sector_id"
    t.index ["assistant_id"], name: "index_incidents_on_assistant_id"
    t.index ["course_id"], name: "index_incidents_on_course_id"
    t.index ["date_incident"], name: "index_incidents_on_date_incident"
    t.index ["institution"], name: "index_incidents_on_institution"
    t.index ["school_group_id"], name: "index_incidents_on_school_group_id"
    t.index ["sector_id"], name: "index_incidents_on_sector_id"
    t.index ["student_id"], name: "index_incidents_on_student_id"
    t.index ["type_incident_id"], name: "index_incidents_on_type_incident_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "incidents_prohibition_and_responsibilities", force: :cascade do |t|
    t.integer "incident_id"
    t.integer "prohibition_and_responsibility_id"
    t.index ["incident_id"], name: "index_incidents_prohibition_and_responsibilities_on_incident_id"
    t.index ["prohibition_and_responsibility_id"], name: "prohibition_index"
  end

  create_table "incidents_student_duties", force: :cascade do |t|
    t.integer "incident_id"
    t.integer "student_duty_id"
    t.index ["incident_id"], name: "index_incidents_student_duties_on_incident_id"
    t.index ["student_duty_id"], name: "index_incidents_student_duties_on_student_duty_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["patient_id"], name: "index_patient_physiologicals_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "student_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["student_id"], name: "index_patients_on_student_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "entity"
    t.boolean "can_create", default: false
    t.boolean "can_read", default: false
    t.boolean "can_update", default: false
    t.boolean "can_destroy", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "can_manage", default: false
    t.boolean "can_extras", default: false
    t.boolean "can_read_restricted", default: false
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "polos", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "institution_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inicial"
    t.index ["institution_id"], name: "index_polos_on_institution_id"
    t.index ["name"], name: "index_polos_on_name"
  end

  create_table "prohibition_and_responsibilities", force: :cascade do |t|
    t.string "item"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "status", default: false
  end

  create_table "school_groups", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "polo_id"
    t.index ["identifier"], name: "index_school_groups_on_identifier"
    t.index ["name"], name: "index_school_groups_on_name"
    t.index ["polo_id"], name: "index_school_groups_on_polo_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "polo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["polo_id"], name: "index_sectors_on_polo_id"
  end

  create_table "seed_migration_data_migrations", id: :serial, force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on", precision: nil
  end

  create_table "student_duties", force: :cascade do |t|
    t.string "item"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "status", default: false
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "course_id"
    t.string "photo"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.bigint "school_group_id"
    t.integer "registration_id"
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["name"], name: "index_students_on_name"
    t.index ["registration_id"], name: "index_students_on_registration_id"
    t.index ["school_group_id"], name: "index_students_on_school_group_id"
  end

  create_table "type_incidents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "username", default: "", null: false
    t.string "name"
    t.integer "siape"
    t.string "avatar"
    t.bigint "course_id"
    t.boolean "admin", default: false
    t.boolean "status", default: true
    t.bigint "polo_id"
    t.boolean "super_admin"
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["polo_id"], name: "index_users_on_polo_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "courses", "polos"
  add_foreign_key "incidents", "courses"
  add_foreign_key "incidents", "sectors"
  add_foreign_key "incidents", "students"
  add_foreign_key "incidents", "type_incidents"
  add_foreign_key "incidents", "users"
  add_foreign_key "patient_appointments", "patients"
  add_foreign_key "patient_habits", "patients"
  add_foreign_key "patient_morbids", "patients"
  add_foreign_key "patient_physiologicals", "patients"
  add_foreign_key "patients", "students"
  add_foreign_key "permissions", "users"
  add_foreign_key "polos", "institutions"
  add_foreign_key "school_groups", "polos"
  add_foreign_key "sectors", "polos"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "school_groups"
  add_foreign_key "users", "courses"
  add_foreign_key "users", "polos"
end
