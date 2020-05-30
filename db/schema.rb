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

ActiveRecord::Schema.define(version: 2019_09_11_020012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "msgs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.text "content", null: false
    t.index ["room_id"], name: "index_msgs_on_room_id"
    t.index ["user_id"], name: "index_msgs_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "sessions", primary_key: "session_id", id: :string, force: :cascade do |t|
    t.string "value", null: false
  end

  create_table "unred_msgs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.text "content", null: false
    t.index ["room_id"], name: "index_unred_msgs_on_room_id"
    t.index ["user_id"], name: "index_unred_msgs_on_user_id"
  end

  create_table "user_rooms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.index ["room_id"], name: "index_user_rooms_on_room_id"
    t.index ["user_id"], name: "index_user_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "hashed_password", null: false
  end

  add_foreign_key "msgs", "rooms"
  add_foreign_key "msgs", "users"
  add_foreign_key "unred_msgs", "rooms"
  add_foreign_key "unred_msgs", "users"
  add_foreign_key "user_rooms", "rooms"
  add_foreign_key "user_rooms", "users"
end
