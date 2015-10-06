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

ActiveRecord::Schema.define(version: 20151006122148) do

  create_table "letters", force: :cascade do |t|
    t.string   "category"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "letters", ["category"], name: "index_letters_on_category"
  add_index "letters", ["name"], name: "index_letters_on_name"

  create_table "paper_letters", force: :cascade do |t|
    t.integer  "letter_id"
    t.integer  "paper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "paper_letters", ["letter_id"], name: "index_paper_letters_on_letter_id"
  add_index "paper_letters", ["paper_id"], name: "index_paper_letters_on_paper_id"

  create_table "papers", force: :cascade do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "test_items", force: :cascade do |t|
    t.integer  "paper_id"
    t.integer  "time"
    t.integer  "corrent"
    t.integer  "wrong"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "test_id"
  end

  add_index "test_items", ["paper_id"], name: "index_test_items_on_paper_id"
  add_index "test_items", ["test_id"], name: "index_test_items_on_test_id"

  create_table "tests", force: :cascade do |t|
    t.integer  "time"
    t.integer  "letter_id"
    t.boolean  "get"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "started",    default: false, null: false
  end

  add_index "tests", ["letter_id"], name: "index_tests_on_letter_id"

end
