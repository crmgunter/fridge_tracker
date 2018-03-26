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

ActiveRecord::Schema.define(version: 20180326183403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.boolean "alcholic"
    t.bigint "fridge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fridge_id"], name: "index_drinks_on_fridge_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.boolean "is_vegan"
    t.date "time_put_in_fridge"
    t.bigint "fridge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fridge_id"], name: "index_foods_on_fridge_id"
  end

  create_table "fridges", force: :cascade do |t|
    t.string "brand"
    t.string "location"
    t.integer "size"
    t.boolean "has_food_in_it"
    t.boolean "has_drinks_in_it"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purple_dranks", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.boolean "alcholic"
    t.bigint "fridge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fridge_id"], name: "index_purple_dranks_on_fridge_id"
  end

  add_foreign_key "drinks", "fridges"
  add_foreign_key "foods", "fridges"
  add_foreign_key "purple_dranks", "fridges"
end
