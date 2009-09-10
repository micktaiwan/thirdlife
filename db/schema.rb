# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090909032455) do

  create_table "actions", :force => true do |t|
    t.integer  "character_id"
    t.datetime "started_at"
    t.integer  "duration"
    t.integer  "type_id"
    t.text     "affects"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.float    "age",             :default => 0.0
    t.float    "energy",          :default => 100.0
    t.float    "hunger",          :default => 0.0
    t.float    "health",          :default => 100.0
    t.integer  "xp",              :default => 0
    t.integer  "mood",            :default => 50
    t.integer  "money",           :default => 0
    t.datetime "time_updated_at", :default => '2009-09-11 00:11:42'
    t.datetime "affected_at",     :default => '2009-09-11 00:11:42'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["user_id"], :name => "index_characters_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
