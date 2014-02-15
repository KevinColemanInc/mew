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

ActiveRecord::Schema.define(version: 20140215201334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "communication_devices", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "cdid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
    t.string   "device_type"
    t.string   "device_model"
    t.datetime "last_communicated_at"
  end

  create_table "communication_devices_meters", id: false, force: true do |t|
    t.uuid "meter_id"
    t.uuid "communication_device_id"
  end

  create_table "communication_devices_users", id: false, force: true do |t|
    t.uuid "communication_device_id"
    t.uuid "member_id"
  end

  create_table "email_messages", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "to"
    t.string   "from"
    t.text     "body"
    t.uuid     "member_id"
    t.uuid     "case_manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grouped_members", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "member_id"
    t.uuid     "member_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managed_members", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "case_manager_id"
    t.uuid     "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.uuid     "member_id"
    t.uuid     "case_manager_id"
    t.datetime "archived_at"
    t.text     "note"
  end

  create_table "member_groups", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "created_by_id"
  end

  create_table "meters", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "mid"
    t.string   "bluetooth_mac"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meters_users", id: false, force: true do |t|
    t.uuid "meter_id"
    t.uuid "member_id"
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
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
    t.datetime "archived_at"
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "member_number"
    t.datetime "date_of_birth"
    t.integer  "roles_mask"
    t.text     "note"
    t.string   "authentication_token"
    t.datetime "token_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
