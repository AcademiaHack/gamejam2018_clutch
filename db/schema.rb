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

ActiveRecord::Schema.define(version: 20180128030018) do

  create_table "audiences", force: :cascade do |t|
    t.string "name"
    t.integer "score"
    t.integer "game_id"
    t.integer "current_slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_audiences_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "player1_id"
    t.integer "player2_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player1_id"], name: "index_games_on_player1_id"
    t.index ["player2_id"], name: "index_games_on_player2_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "current_slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turns", force: :cascade do |t|
    t.string "element_player1"
    t.string "element_player2"
    t.string "element_winner"
    t.integer "game_id"
    t.boolean "stop_player1"
    t.boolean "stop_player"
    t.integer "slot", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_turns_on_game_id"
  end

end