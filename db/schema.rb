# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_194013) do

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.datetime "release_date"
    t.float "rating"
    t.integer "tmdb_id"
    t.string "img_url"
    t.string "synopsis"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_movies", force: :cascade do |t|
    t.integer "streaming_service_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "stream_location"
    t.index ["movie_id"], name: "index_service_movies_on_movie_id"
    t.index ["streaming_service_id"], name: "index_service_movies_on_streaming_service_id"
  end

  create_table "streaming_services", force: :cascade do |t|
    t.string "name"
    t.string "streaming_url"
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "icon"
  end

  create_table "user_movies", force: :cascade do |t|
    t.boolean "would_watch"
    t.boolean "seen_before"
    t.integer "rating"
    t.string "review"
    t.integer "movie_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_user_movies_on_movie_id"
    t.index ["user_id"], name: "index_user_movies_on_user_id"
  end

  create_table "user_services", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "streaming_service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["streaming_service_id"], name: "index_user_services_on_streaming_service_id"
    t.index ["user_id"], name: "index_user_services_on_user_id"
  end

  create_table "user_view_parties", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "view_party_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_view_parties_on_user_id"
    t.index ["view_party_id"], name: "index_user_view_parties_on_view_party_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "location"
    t.integer "age"
    t.string "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img", default: "amsee.png"
  end

  create_table "view_parties", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.integer "movie_id", null: false
    t.string "streaming_location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_view_parties_on_movie_id"
  end

  add_foreign_key "service_movies", "movies"
  add_foreign_key "service_movies", "streaming_services"
  add_foreign_key "user_movies", "movies"
  add_foreign_key "user_movies", "users"
  add_foreign_key "user_services", "streaming_services"
  add_foreign_key "user_services", "users"
  add_foreign_key "user_view_parties", "users"
  add_foreign_key "user_view_parties", "view_parties"
  add_foreign_key "view_parties", "movies"
end
