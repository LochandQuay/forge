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

ActiveRecord::Schema.define(version: 20171010175511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_api_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_api_users_on_reset_password_token", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_id", null: false
    t.string "dbf_id", null: false
    t.string "name", null: false
    t.string "card_set", null: false
    t.string "card_type", null: false
    t.string "faction", null: false
    t.string "rarity", null: false
    t.integer "cost", null: false
    t.integer "attack"
    t.integer "health"
    t.integer "armor"
    t.string "text"
    t.string "flavor", null: false
    t.string "artist", null: false
    t.boolean "collectible", null: false
    t.boolean "elite", null: false
    t.string "race"
    t.string "player_class", null: false
    t.string "img", null: false
    t.string "img_gold", null: false
    t.string "how_to_get"
    t.string "how_to_get_gold"
    t.string "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "durability"
    t.index ["card_id"], name: "index_cards_on_card_id"
    t.index ["card_set"], name: "index_cards_on_card_set"
    t.index ["name"], name: "index_cards_on_name"
    t.index ["player_class"], name: "index_cards_on_player_class"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id", null: false
    t.string "type", default: "Standard"
    t.integer "class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_id"], name: "index_decks_on_class_id"
    t.index ["name", "type", "class_id", "user_id"], name: "index_decks_on_name_and_type_and_class_id_and_user_id", unique: true
    t.index ["type"], name: "index_decks_on_type"
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "patches", force: :cascade do |t|
    t.string "patch", null: false
    t.index ["patch"], name: "index_patches_on_patch"
  end

  create_table "users", force: :cascade do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
