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

ActiveRecord::Schema.define(version: 20170914054954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drives", force: :cascade do |t|
    t.string "start_time", null: false
    t.string "end_time"
    t.string "result"
    t.bigint "game_id", null: false
    t.string "possession", null: false
    t.integer "start_position", null: false
    t.integer "end_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_drives_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.string "stadium"
    t.string "site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "number", null: false
    t.string "position", null: false
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "plays", force: :cascade do |t|
    t.integer "down", null: false
    t.integer "distance", null: false
    t.integer "yards_gained"
    t.string "play_type", null: false
    t.bigint "passer_id"
    t.bigint "receiver_id"
    t.bigint "rusher_id"
    t.bigint "tackler_id"
    t.bigint "intercepted_id"
    t.bigint "fumble_forced_id"
    t.bigint "fumble_recovery_id"
    t.integer "turned_over_at"
    t.integer "recovered_at"
    t.integer "return_distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fumble_forced_id"], name: "index_plays_on_fumble_forced_id"
    t.index ["fumble_recovery_id"], name: "index_plays_on_fumble_recovery_id"
    t.index ["intercepted_id"], name: "index_plays_on_intercepted_id"
    t.index ["passer_id"], name: "index_plays_on_passer_id"
    t.index ["receiver_id"], name: "index_plays_on_receiver_id"
    t.index ["rusher_id"], name: "index_plays_on_rusher_id"
    t.index ["tackler_id"], name: "index_plays_on_tackler_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbrev", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "drives", "games"
  add_foreign_key "players", "teams"
end
