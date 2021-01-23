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

ActiveRecord::Schema.define(version: 2020_11_29_204023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bottles", force: :cascade do |t|
    t.bigint "unit_id", null: false
    t.bigint "wine_id", null: false
    t.string "name"
    t.string "size"
    t.string "vintage"
    t.integer "depth_position"
    t.integer "height_position"
    t.integer "width_position"
    t.float "post_tax_cost"
    t.float "duty"
    t.float "vat"
    t.float "pre_tax_cost"
    t.float "storage_cost"
    t.float "transport_cost"
    t.float "value_out"
    t.date "date_in"
    t.date "date_out"
    t.string "tax_status"
    t.string "broker_fee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number"
    t.boolean "half_bottle"
    t.boolean "bottle"
    t.boolean "magnum"
    t.boolean "double_magnum"
    t.index ["unit_id"], name: "index_bottles_on_unit_id"
    t.index ["wine_id"], name: "index_bottles_on_wine_id"
  end

  create_table "places", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "account_number"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.string "website"
    t.string "login"
    t.string "password"
    t.boolean "professional"
    t.string "warehouse_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "units", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.string "name"
    t.string "note"
    t.string "rotation"
    t.integer "bottles_inside"
    t.integer "capacity"
    t.integer "depth_number"
    t.integer "height_number"
    t.integer "width_number"
    t.float "post_tax_cost"
    t.float "duty"
    t.float "vat"
    t.float "pre_tax_cost"
    t.float "storage_cost"
    t.float "transport_cost"
    t.float "value_out"
    t.string "broker_fee"
    t.boolean "mixed"
    t.boolean "owc"
    t.boolean "oc"
    t.date "date_in"
    t.date "date_out"
    t.string "tax_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "fridge"
    t.boolean "rack"
    t.string "bottles_size"
    t.boolean "packaging"
    t.index ["place_id"], name: "index_units_on_place_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wines", force: :cascade do |t|
    t.bigint "producer_id", null: false
    t.string "name"
    t.string "nickname"
    t.string "color"
    t.string "type"
    t.string "lwin"
    t.float "longitude"
    t.float "latitude"
    t.string "country"
    t.string "region"
    t.string "subregion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["producer_id"], name: "index_wines_on_producer_id"
  end

  add_foreign_key "bottles", "units"
  add_foreign_key "bottles", "wines"
  add_foreign_key "places", "users"
  add_foreign_key "units", "places"
  add_foreign_key "wines", "producers"
end
