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

ActiveRecord::Schema.define(version: 20150617114058) do

  create_table "accomodations", force: :cascade do |t|
    t.integer  "accomodates"
    t.text     "description"
    t.integer  "night_rate"
    t.string   "address"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "accomodations", ["user_id"], name: "index_accomodations_on_user_id"

  create_table "images", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "accomodation_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "images", ["accomodation_id"], name: "index_images_on_accomodation_id"
  add_index "images", ["user_id"], name: "index_images_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "user_picture_file_name"
    t.string   "user_picture_content_type"
    t.integer  "user_picture_file_size"
    t.datetime "user_picture_updated_at"
  end

end
