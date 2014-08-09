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

ActiveRecord::Schema.define(version: 20140809041349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["name"], name: "index_brands_on_name", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "name",       limit: 50
    t.decimal  "price",                 precision: 10, scale: 2
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
    t.integer  "quantity"
    t.integer  "barcode"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["type_id"], name: "index_products_on_type_id", using: :btree

  create_table "types", force: true do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code",                  null: false
  end

  add_index "types", ["code"], name: "index_types_on_code", unique: true, using: :btree

end
