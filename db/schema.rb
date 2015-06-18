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

ActiveRecord::Schema.define(version: 20150617002224) do

  create_table "admins", force: :cascade do |t|
    t.string   "username",           limit: 255,              null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "head",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "departments", ["name"], name: "index_departments_on_name", using: :btree

  create_table "nasfiles", force: :cascade do |t|
    t.string   "file_name",        limit: 255,   null: false
    t.string   "file_number",      limit: 255,   null: false
    t.integer  "file_sub",         limit: 4
    t.integer  "file_vol",         limit: 4
    t.integer  "category_id",      limit: 4
    t.text     "file_description", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "nasfiles", ["category_id"], name: "index_nasfiles_on_category_id", using: :btree
  add_index "nasfiles", ["file_name"], name: "index_nasfiles_on_file_name", using: :btree
  add_index "nasfiles", ["file_number"], name: "index_nasfiles_on_file_number", using: :btree

  create_table "offices", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "department_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "offices", ["department_id"], name: "index_offices_on_department_id", using: :btree

  create_table "trackers", force: :cascade do |t|
    t.integer  "nasfile_id",          limit: 4
    t.integer  "office_sent_from_id", limit: 4
    t.integer  "sender_id",           limit: 4
    t.integer  "receiver_id",         limit: 4
    t.integer  "office_sent_to_id",   limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "trackers", ["nasfile_id"], name: "index_trackers_on_nasfile_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",          limit: 255, default: "",    null: false
    t.string   "last_name",           limit: 255, default: "",    null: false
    t.string   "username",            limit: 255, default: "",    null: false
    t.string   "encrypted_password",  limit: 255, default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "registry_officer",    limit: 1,   default: false
    t.integer  "office_id",           limit: 4
  end

  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["office_id"], name: "index_users_on_office_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "nasfiles", "categories"
  add_foreign_key "offices", "departments"
  add_foreign_key "trackers", "nasfiles"
end
