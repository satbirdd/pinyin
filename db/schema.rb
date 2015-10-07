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

ActiveRecord::Schema.define(version: 20151007044741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "letters", force: :cascade do |t|
    t.string   "category"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "letters", ["category"], name: "index_letters_on_category", using: :btree
  add_index "letters", ["name"], name: "index_letters_on_name", using: :btree

  create_table "paper_letters", force: :cascade do |t|
    t.integer  "letter_id"
    t.integer  "paper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "paper_letters", ["letter_id"], name: "index_paper_letters_on_letter_id", using: :btree
  add_index "paper_letters", ["paper_id"], name: "index_paper_letters_on_paper_id", using: :btree

  create_table "papers", force: :cascade do |t|
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "test_items", force: :cascade do |t|
    t.integer  "time"
    t.integer  "letter_id"
    t.boolean  "get",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "test_id"
  end

  add_index "test_items", ["letter_id"], name: "index_test_items_on_letter_id", using: :btree
  add_index "test_items", ["test_id"], name: "index_test_items_on_test_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.integer  "paper_id"
    t.integer  "time"
    t.integer  "correct"
    t.integer  "wrong"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "started",    default: false, null: false
  end

  add_index "tests", ["paper_id"], name: "index_tests_on_paper_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "paper_letters", "letters"
  add_foreign_key "paper_letters", "papers"
  add_foreign_key "test_items", "letters"
  add_foreign_key "test_items", "tests"
  add_foreign_key "tests", "papers"
end
