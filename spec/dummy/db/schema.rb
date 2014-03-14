# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140313134259) do

  create_table "articles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gamification_medals", force: true do |t|
    t.integer  "task_id"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamification_medals", ["task_id"], name: "index_gamification_medals_on_task_id"

  create_table "gamification_rewards", force: true do |t|
    t.integer  "task_id"
    t.integer  "rewardable_id"
    t.string   "rewardable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamification_rewards", ["rewardable_id", "rewardable_type"], name: "index_gamification_scorings_on_subjectable"
  add_index "gamification_rewards", ["task_id"], name: "index_gamification_rewards_on_task_id"

  create_table "gamification_tasks", force: true do |t|
    t.integer  "rewarding_id"
    t.string   "rewarding_type"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamification_tasks", ["rewarding_id", "rewarding_type"], name: "index_gamification_tasks_on_rewarding_id_and_rewarding_type"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
