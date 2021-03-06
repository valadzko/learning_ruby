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

ActiveRecord::Schema.define(version: 20160325100306) do

  create_table "railway_station_routes", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "railway_station_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "station_index_in_route"
  end

  add_index "railway_station_routes", ["railway_station_id"], name: "index_railway_station_routes_on_railway_station_id"
  add_index "railway_station_routes", ["route_id"], name: "index_railway_station_routes_on_route_id"

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "train_id"
    t.integer  "first_station_id"
    t.integer  "last_station_id"
    t.string   "username"
  end

  add_index "tickets", ["first_station_id"], name: "index_tickets_on_first_station_id"
  add_index "tickets", ["last_station_id"], name: "index_tickets_on_last_station_id"
  add_index "tickets", ["train_id"], name: "index_tickets_on_train_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.string   "wagons_desc_order", default: "0"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "route_id"
  end

  add_index "trains", ["route_id"], name: "index_trains_on_route_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wagons", force: :cascade do |t|
    t.integer  "top_seats"
    t.integer  "bottom_seats"
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.integer  "regular_seats"
    t.integer  "number"
    t.string   "type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "train_id"
  end

  add_index "wagons", ["train_id"], name: "index_wagons_on_train_id"

end
