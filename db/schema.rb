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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120704211054) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "unlock_token"
    t.integer  "failed_logins_count",             :default => 0
    t.datetime "lock_expires_at"
    t.string   "stripe_token"
    t.string   "stripe_customer_token"
    t.integer  "stripe_plan",                     :default => 0
    t.string   "uid"
    t.string   "provider"
    t.string   "avatar"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "accounts", ["activation_token"], :name => "index_accounts_on_activation_token", :unique => true
  add_index "accounts", ["email"], :name => "index_accounts_on_email"
  add_index "accounts", ["name"], :name => "index_accounts_on_name"
  add_index "accounts", ["remember_me_token"], :name => "index_accounts_on_remember_me_token", :unique => true
  add_index "accounts", ["reset_password_token"], :name => "index_accounts_on_reset_password_token", :unique => true
  add_index "accounts", ["unlock_token"], :name => "index_accounts_on_unlock_token", :unique => true

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "price"
    t.string   "image"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "courses", ["account_id"], :name => "index_courses_on_account_id"
  add_index "courses", ["name"], :name => "index_courses_on_name"

  create_table "enrollments", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "account_id"
  end

  add_index "enrollments", ["account_id"], :name => "index_enrollments_on_account_id"
  add_index "enrollments", ["course_id"], :name => "index_enrollments_on_course_id"

  create_table "sessions", :force => true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "name"
    t.text     "body"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["course_id"], :name => "index_sessions_on_course_id"
  add_index "sessions", ["name"], :name => "index_sessions_on_name"

end
