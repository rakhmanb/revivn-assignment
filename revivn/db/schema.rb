# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_10_035432) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hardware_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orgs", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "zip"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickup_items", force: :cascade do |t|
    t.integer "hardware_type_id"
    t.integer "quantity"
    t.text "description"
    t.integer "pickup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickup_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "org_id"
    t.string "integer"
    t.datetime "pickup_datetime"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "zip"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pickup_status_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "org_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
