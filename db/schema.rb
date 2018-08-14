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

ActiveRecord::Schema.define(version: 20180812230139) do

  create_table "announcements", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.text     "description"
    t.string   "title"
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.text     "description"
    t.datetime "end_time"
    t.string   "location"
    t.integer  "participant_slots"
    t.datetime "start_time"
    t.string   "title"
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer  "event_id"
    t.decimal  "hours"
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["event_id"], name: "index_participants_on_event_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "updated_at",            null: false
    t.text     "value"
    t.string   "var",                   null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "current_sign_in_at"
    t.string   "current_sign_in_ip"
    t.boolean  "deactivated"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "last_sign_in_at"
    t.string   "last_sign_in_ip"
    t.string   "phone_number"
    t.integer  "rank"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string   "reset_password_token"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
