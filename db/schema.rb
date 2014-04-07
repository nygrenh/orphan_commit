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

ActiveRecord::Schema.define(version: 20140407185754) do

  create_table "articles", force: true do |t|
    t.string   "key"
    t.string   "author"
    t.string   "title"
    t.string   "journal"
    t.integer  "volume"
    t.integer  "number"
    t.integer  "year"
    t.string   "pages"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "month"
    t.string   "note"
    t.string   "publisher"
    t.string   "address"
  end

  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_authors", force: true do |t|
    t.integer  "author_id"
    t.integer  "reference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_editors", force: true do |t|
    t.integer  "reference_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", force: true do |t|
    t.integer  "journal_id"
    t.string   "title"
    t.integer  "year"
    t.integer  "volume"
    t.integer  "number"
    t.string   "pages"
    t.integer  "month"
    t.string   "note"
    t.string   "key"
    t.integer  "publisher_id"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "edition"
    t.string   "booktitle"
    t.string   "reference_type"
    t.integer  "series_id"
    t.integer  "organization_id"
  end

  create_table "series", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
