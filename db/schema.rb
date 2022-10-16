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

ActiveRecord::Schema[7.0].define(version: 2022_10_15_211809) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hangouts", force: :cascade do |t|
    t.string "host"
    t.string "participants", default: [], array: true
    t.string "title"
    t.string "what"
    t.string "why"
    t.string "location"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.bigint "user_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "full_name"
    t.string "password_digest"
    t.string "location"
    t.string "gender"
    t.integer "age"
    t.string "friends_list", default: [], array: true
    t.string "preferences", default: [], array: true
    t.string "online_status"
    t.datetime "last_online"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_in_chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_users_in_chats_on_chat_id"
    t.index ["user_id"], name: "index_users_in_chats_on_user_id"
  end

  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "users_in_chats", "chats"
  add_foreign_key "users_in_chats", "users"
end
