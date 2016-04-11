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

ActiveRecord::Schema.define(version: 20160411104535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "archers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "armies", force: true do |t|
    t.integer  "infantry"
    t.integer  "archers"
    t.integer  "knights"
    t.integer  "spending_balance", default: 100000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "battles", force: true do |t|
    t.integer  "army_a"
    t.integer  "army_b"
    t.integer  "attack_initiator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "battles", ["army_a"], name: "index_battles_on_army_a", using: :btree
  add_index "battles", ["army_b"], name: "index_battles_on_army_b", using: :btree

  create_table "foot_soldiers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knights", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "soldiers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "army_id"
    t.integer  "cost"
    t.integer  "health"
    t.integer  "attack_damage"
    t.integer  "defense"
    t.integer  "luck"
    t.string   "type"
  end

end
