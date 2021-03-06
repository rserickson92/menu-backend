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

ActiveRecord::Schema.define(version: 2021_12_16_014024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", limit: 50, null: false
    t.integer "price", null: false
    t.text "description"
    t.boolean "highlighted", default: false, null: false
    t.index ["name"], name: "index_menu_items_on_name", unique: true
    t.check_constraint "price >= 0"
  end

  create_table "menu_items_menus", id: false, force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "menu_item_id", null: false
  end

# Could not dump table "menus" because of following StandardError
#   Unknown type 't_menu_type' for column 'menu_type'

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", limit: 50, null: false
    t.text "address", null: false
  end

  add_foreign_key "menus", "restaurants"
end
