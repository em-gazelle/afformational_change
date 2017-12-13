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

ActiveRecord::Schema.define(version: 20171213051336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "afformations", force: :cascade do |t|
    t.string   "afformation_text"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "afformation_focus_area"
    t.boolean  "user_submitted_personal_afformation"
    t.integer  "user_id"
  end

  add_index "afformations", ["user_id"], name: "index_afformations_on_user_id", using: :btree

  create_table "sent_afformations", force: :cascade do |t|
    t.datetime "email_replied_to_date"
    t.boolean  "email_replied_to"
    t.text     "user_response_to_afformation"
    t.integer  "user_id"
    t.integer  "afformation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sent_afformations", ["afformation_id"], name: "index_sent_afformations_on_afformation_id", using: :btree
  add_index "sent_afformations", ["user_id"], name: "index_sent_afformations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "name"
    t.string   "timezone"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "personal_afformations_submitted"
    t.boolean  "deactivated"
    t.string   "encrypted_password",              default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                           default: false
    t.string   "personal_afformation_focus_area", default: [],                 array: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "sent_afformations", "afformations"
  add_foreign_key "sent_afformations", "users"
end
