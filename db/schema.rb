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

ActiveRecord::Schema.define(version: 20170801051250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "matches", force: :cascade do |t|
    t.date "date"
    t.bigint "team1_id"
    t.bigint "team2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "team1_id", "team2_id"], name: "index_matches_on_date_and_team1_id_and_team2_id", unique: true
    t.index ["team1_id"], name: "index_matches_on_team1_id"
    t.index ["team2_id"], name: "index_matches_on_team2_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "team_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "team_id"], name: "index_players_on_name_and_team_id", unique: true
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "score_entries", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "match_id"
    t.boolean "batted", default: true
    t.boolean "out", default: false
    t.integer "bat_runs"
    t.integer "balls_faced"
    t.integer "six"
    t.integer "four"
    t.decimal "overs", precision: 5, scale: 2, default: "0.0"
    t.integer "maidens"
    t.integer "bowl_runs"
    t.integer "wickets"
    t.integer "catches"
    t.integer "stumpings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_score_entries_on_match_id"
    t.index ["player_id"], name: "index_score_entries_on_player_id"
  end

  create_table "stats", force: :cascade do |t|
    t.bigint "player_id"
    t.integer "matches", default: 0
    t.integer "innings", default: 0
    t.integer "not_outs", default: 0
    t.integer "bat_runs", default: 0
    t.integer "high_score", default: 0
    t.decimal "bat_avg", precision: 5, scale: 2, default: "0.0"
    t.integer "balls_faced", default: 0
    t.decimal "bat_strike_rate", precision: 5, scale: 2, default: "0.0"
    t.integer "hundred", default: 0
    t.integer "fifty", default: 0
    t.integer "six", default: 0
    t.integer "four", default: 0
    t.integer "zero", default: 0
    t.decimal "overs", precision: 5, scale: 2, default: "0.0"
    t.integer "maidens", default: 0
    t.integer "bowl_runs", default: 0
    t.integer "wickets", default: 0
    t.integer "best_bowling_wicket", default: 0
    t.integer "best_bowling_runs", default: 0
    t.decimal "bowl_avg", precision: 5, scale: 2, default: "0.0"
    t.decimal "economy", precision: 5, scale: 2
    t.decimal "bowl_strike_rate", precision: 5, scale: 2
    t.integer "five_wickets", default: 0
    t.integer "catches", default: 0
    t.integer "stumpings", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_stats_on_player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "teams", column: "team1_id"
  add_foreign_key "matches", "teams", column: "team2_id"
  add_foreign_key "players", "teams"
  add_foreign_key "score_entries", "matches"
  add_foreign_key "score_entries", "players"
  add_foreign_key "stats", "players"
end
