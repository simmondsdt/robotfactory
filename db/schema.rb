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

ActiveRecord::Schema.define(version: 20161110164517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventors", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.date     "hire_date"
    t.string   "speciality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "robot"
    t.integer  "robot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["robot_id"], name: "index_parts_on_robot_id", using: :btree
  end

  create_table "robots", force: :cascade do |t|
    t.string   "name"
    t.string   "serial_number"
    t.boolean  "evil"
    t.string   "color"
    t.string   "industry"
    t.integer  "inventor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["inventor_id"], name: "index_robots_on_inventor_id", using: :btree
  end

  add_foreign_key "parts", "robots"
  add_foreign_key "robots", "inventors"
end
