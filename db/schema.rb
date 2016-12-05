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

ActiveRecord::Schema.define(version: 20161117120127) do

  create_table "appointeds", force: :cascade do |t|
    t.string   "job_seeker_id", limit: 255
    t.string   "resume",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "job_ads", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "key_skills",     limit: 255
    t.string   "req_experience", limit: 255
    t.string   "industry",       limit: 255
    t.string   "function",       limit: 255
    t.string   "job_details",    limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "recruiter_id",   limit: 4
    t.string   "city",           limit: 255
    t.string   "owner_name",     limit: 255
    t.string   "email",          limit: 255
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer  "job_seeker_id", limit: 4
    t.integer  "recruiter_id",  limit: 4
    t.integer  "job_ad_id",     limit: 4
    t.string   "resume",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "job_seekers", force: :cascade do |t|
    t.string   "first_name",    limit: 100
    t.string   "last_name",     limit: 100
    t.string   "contact",       limit: 255
    t.string   "email",         limit: 50
    t.string   "city",          limit: 255
    t.string   "image",         limit: 255
    t.boolean  "gender"
    t.string   "password",      limit: 255
    t.string   "key_skills",    limit: 255
    t.string   "experience",    limit: 255
    t.string   "industry",      limit: 255
    t.string   "function",      limit: 255
    t.string   "qualification", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "resume",        limit: 255
  end

  create_table "recruiters", force: :cascade do |t|
    t.string   "first_name", limit: 100
    t.string   "last_name",  limit: 100
    t.string   "contact",    limit: 255
    t.string   "email",      limit: 50
    t.string   "city",       limit: 255
    t.string   "image",      limit: 255
    t.boolean  "gender"
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
