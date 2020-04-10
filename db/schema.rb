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

ActiveRecord::Schema.define(version: 2020_04_10_143223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.text "title", null: false
    t.jsonb "plot", default: {}
    t.integer "number", null: false
    t.bigint "season_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plot"], name: "index_episodes_on_plot", using: :gin
    t.index ["season_id"], name: "index_episodes_on_season_id"
    t.index ["title", "number"], name: "index_episodes_on_title_and_number"
  end

  create_table "movies", force: :cascade do |t|
    t.text "title", null: false
    t.jsonb "plot", default: {}
    t.float "unit_price", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plot"], name: "index_movies_on_plot", using: :gin
    t.index ["title"], name: "index_movies_on_title"
  end

# Could not dump table "orders" because of following StandardError
#   Unknown type 'video_quality' for column 'quality'

  create_table "seasons", force: :cascade do |t|
    t.text "title", null: false
    t.jsonb "plot", default: {}
    t.integer "number", null: false
    t.float "unit_price", default: 0.0
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_seasons_on_movie_id"
    t.index ["plot"], name: "index_seasons_on_plot", using: :gin
    t.index ["title", "number"], name: "index_seasons_on_title_and_number"
  end

  create_table "user_libraries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_libraries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "episodes", "seasons"
  add_foreign_key "orders", "user_libraries"
  add_foreign_key "seasons", "movies"
  add_foreign_key "user_libraries", "users"
end
