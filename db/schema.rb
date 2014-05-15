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

ActiveRecord::Schema.define(version: 20140507110540) do

  create_table "articles", force: true do |t|
    t.string   "headling"
    t.string   "header"
    t.integer  "score"
    t.integer  "region_id"
    t.integer  "language_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "reportev"
    t.integer  "reportco"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizes", force: true do |t|
    t.integer  "category_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comment_rebuttals", force: true do |t|
    t.integer  "user_id"
    t.integer  "parent_comment"
    t.integer  "rebuttal_id"
    t.integer  "score"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "parent_comment"
    t.integer  "article_id"
    t.integer  "score"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "config_params", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "counterevidences", force: true do |t|
    t.string   "url"
    t.string   "description"
    t.integer  "score"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "evidences", force: true do |t|
    t.string   "url"
    t.string   "description"
    t.integer  "score"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.integer  "followed_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "shortname"
    t.string   "longname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rebuttles", force: true do |t|
    t.string   "headling"
    t.string   "header"
    t.integer  "score"
    t.integer  "user_id"
    t.integer  "article_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regionalizes", force: true do |t|
    t.integer  "region_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.integer  "parent_region"
    t.integer  "multilengual_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_articles", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "report_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vote_articles", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.boolean  "is_up"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vote_comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.boolean  "is_up"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vote_evidences", force: true do |t|
    t.integer  "user_id"
    t.integer  "evidence_id"
    t.boolean  "is_up"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vote_rebuttals", force: true do |t|
    t.integer  "user_id"
    t.integer  "rebuttal_id"
    t.boolean  "is_up"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
