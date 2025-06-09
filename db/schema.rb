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

ActiveRecord::Schema[7.1].define(version: 2025_06_08_182739) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.text "contact_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connection_comments", force: :cascade do |t|
    t.bigint "connection_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["connection_id"], name: "index_connection_comments_on_connection_id"
    t.index ["user_id"], name: "index_connection_comments_on_user_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.boolean "opened"
    t.boolean "attended_casting"
    t.boolean "accepted_option"
    t.boolean "busy_casting"
    t.integer "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_agency_profile_id"
    t.bigint "agency_id"
    t.index ["agency_id"], name: "index_connections_on_agency_id"
    t.index ["listing_id"], name: "index_connections_on_listing_id"
    t.index ["model_agency_profile_id"], name: "index_connections_on_model_agency_profile_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.text "extra_info"
    t.bigint "agency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_agency_profile_id"
    t.date "checkin"
    t.date "checkout"
    t.index ["agency_id"], name: "index_hotels_on_agency_id"
    t.index ["model_agency_profile_id"], name: "index_hotels_on_model_agency_profile_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "client_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "listing_type"
    t.string "location"
    t.string "address"
    t.string "photographer"
    t.string "stylist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "start_time"
    t.time "end_time"
    t.text "extra_info"
    t.index ["client_id"], name: "index_listings_on_client_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "model_agency_profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "agency_id"
    t.bigint "user_id"
    t.boolean "active", default: false
    t.boolean "selected", default: false
    t.index ["agency_id"], name: "index_model_agency_profiles_on_agency_id"
    t.index ["user_id"], name: "index_model_agency_profiles_on_user_id"
  end

  create_table "travels", force: :cascade do |t|
    t.bigint "agency_id", null: false
    t.string "origin"
    t.string "destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "extra_info"
    t.bigint "model_agency_profile_id"
    t.date "date"
    t.time "time"
    t.index ["agency_id"], name: "index_travels_on_agency_id"
    t.index ["model_agency_profile_id"], name: "index_travels_on_model_agency_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
    t.string "f_name"
    t.string "l_name"
    t.string "username"
    t.bigint "agency_id"
    t.index ["agency_id"], name: "index_users_on_agency_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "connection_comments", "connections"
  add_foreign_key "connections", "agencies"
  add_foreign_key "connections", "listings"
  add_foreign_key "connections", "model_agency_profiles"
  add_foreign_key "hotels", "agencies"
  add_foreign_key "hotels", "model_agency_profiles"
  add_foreign_key "listings", "clients"
  add_foreign_key "listings", "users"
  add_foreign_key "model_agency_profiles", "agencies"
  add_foreign_key "model_agency_profiles", "users"
  add_foreign_key "travels", "agencies"
  add_foreign_key "travels", "model_agency_profiles"
  add_foreign_key "users", "agencies"
end
