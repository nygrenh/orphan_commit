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

ActiveRecord::Schema.define(version: 20140403005530) do

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
  end

end
