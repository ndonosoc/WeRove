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

ActiveRecord::Schema.define(version: 2020_03_10_162046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recommendation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recommendation_id"], name: "index_bookmarks_on_recommendation_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "title"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "local_id"
    t.bigint "tourist_id"
    t.boolean "available"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "tourist_seen", default: false
    t.boolean "local_seen", default: false
    t.index ["local_id"], name: "index_matches_on_local_id"
    t.index ["tourist_id"], name: "index_matches_on_tourist_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "match_id"
    t.bigint "messager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read"
    t.bigint "receiver_id"
    t.index ["match_id"], name: "index_messages_on_match_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "match_id"
    t.integer "rating"
    t.bigint "rated_id"
    t.bigint "rater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_ratings_on_match_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "category"
    t.string "description"
    t.string "location"
    t.string "price_range"
    t.string "duration"
    t.string "reservation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.bigint "user_id"
    t.bigint "recommendation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recommendation_id"], name: "index_reviews_on_recommendation_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "user_interests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "interest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_user_interests_on_interest_id"
    t.index ["user_id"], name: "index_user_interests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.date "birthday"
    t.string "gender"
    t.integer "score"
    t.boolean "verified"
    t.string "biography"
    t.boolean "available"
    t.text "languages", array: true
    t.string "occupation"
    t.string "first_name"
    t.string "last_name"
    t.float "latitude"
    t.float "longitude"
    t.string "country_flag"
    t.integer "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookmarks", "recommendations"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "messages", "matches"
  add_foreign_key "ratings", "matches"
  add_foreign_key "recommendations", "users"
  add_foreign_key "reviews", "recommendations"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_interests", "interests"
  add_foreign_key "user_interests", "users"
end
