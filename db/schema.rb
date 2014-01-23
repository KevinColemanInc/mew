# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140122205054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "case_managers", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "case_managers", ["email"], name: "index_case_managers_on_email", unique: true, using: :btree
  add_index "case_managers", ["reset_password_token"], name: "index_case_managers_on_reset_password_token", unique: true, using: :btree

  create_table "case_managers_patient_groups", id: false, force: true do |t|
    t.uuid "case_manager_id"
    t.uuid "patient_group_id"
  end

  create_table "communication_devices", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "cdid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "communication_devices_meters", id: false, force: true do |t|
    t.uuid "meter_id"
    t.uuid "communication_device_id"
  end

  create_table "communication_devices_patients", id: false, force: true do |t|
    t.uuid "communication_device_id"
    t.uuid "patient_id"
  end

  create_table "measurements", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.integer  "glucose_value"
    t.datetime "measured_at"
    t.datetime "retrieved_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code_number"
    t.string   "reading_type"
    t.uuid     "communication_device_id"
    t.uuid     "meter_id"
    t.uuid     "patient_id"
  end

  create_table "meters", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "mid"
    t.string   "bluetooth_mac"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meters_patients", id: false, force: true do |t|
    t.uuid "meter_id"
    t.uuid "patient_id"
  end

  create_table "patient_groups", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["email"], name: "index_patients_on_email", unique: true, using: :btree
  add_index "patients", ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true, using: :btree

  create_table "patients_patient_groups", id: false, force: true do |t|
    t.uuid "patient_id"
    t.uuid "patient_group_id"
  end

end
