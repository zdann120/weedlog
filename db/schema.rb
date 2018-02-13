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

ActiveRecord::Schema.define(version: 2018_02_13_084250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "effects", force: :cascade do |t|
    t.string "name", null: false
    t.integer "mood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "retailers", force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_retailers_on_name", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "strain_id"
    t.bigint "user_id"
    t.integer "rating"
    t.text "comment"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "retailer_id"
    t.string "product_type"
    t.index ["retailer_id"], name: "index_reviews_on_retailer_id"
    t.index ["strain_id"], name: "index_reviews_on_strain_id"
    t.index ["token"], name: "index_reviews_on_token", unique: true
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "strain_effects", force: :cascade do |t|
    t.bigint "strain_id"
    t.bigint "effect_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["effect_id"], name: "index_strain_effects_on_effect_id"
    t.index ["strain_id"], name: "index_strain_effects_on_strain_id"
  end

  create_table "strains", force: :cascade do |t|
    t.string "token"
    t.string "name"
    t.string "lineage"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_strains_on_name", unique: true
    t.index ["token"], name: "index_strains_on_token", unique: true
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

  add_foreign_key "reviews", "strains"
  add_foreign_key "reviews", "users"
  add_foreign_key "strain_effects", "effects"
  add_foreign_key "strain_effects", "strains"
end
