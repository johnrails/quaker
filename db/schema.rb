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

ActiveRecord::Schema.define(version: 20130925231004) do

  create_table "coordinates", force: true do |t|
    t.decimal  "latitude",      precision: 10, scale: 0
    t.decimal  "longitude",     precision: 10, scale: 0
    t.decimal  "depth",         precision: 10, scale: 0
    t.integer  "earthquake_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "earthquakes", force: true do |t|
    t.decimal  "magnitude",  precision: 10, scale: 0
    t.string   "place"
    t.datetime "time"
    t.string   "url"
    t.string   "detail_url"
    t.integer  "felt"
    t.decimal  "cdi",        precision: 10, scale: 0
    t.decimal  "mmi",        precision: 10, scale: 0
    t.string   "alert"
    t.string   "status"
    t.integer  "tsumani"
    t.integer  "sig"
    t.string   "code"
    t.integer  "nst"
    t.decimal  "dmin",       precision: 10, scale: 0
    t.decimal  "gap",        precision: 10, scale: 0
    t.string   "mag_type"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: true do |t|
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
