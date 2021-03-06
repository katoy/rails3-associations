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

ActiveRecord::Schema.define(:version => 20131118163736) do

  create_table "addresses", :force => true do |t|
    t.string   "kind",       :limit => 4
    t.string   "val",        :limit => 256
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "addressings", :force => true do |t|
    t.integer "adr_id"
    t.string  "adr_type"
    t.integer "addrsess_id"
  end

  create_table "assemblies", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "assemblies_parts", :force => true do |t|
    t.integer "assembly_id"
    t.integer "part_id"
  end

  create_table "comments", :force => true do |t|
    t.string   "user_name",    :limit => 32
    t.text     "body",         :limit => 4000
    t.string   "picture"
    t.integer  "idea_id",                                     :null => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "lock_version",                 :default => 0
  end

  add_index "comments", ["idea_id"], :name => "index_comments_on_idea_id"

  create_table "ideas", :force => true do |t|
    t.string   "name",           :limit => 32
    t.text     "description",    :limit => 4000
    t.string   "picture"
    t.integer  "comments_count",                 :default => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "lock_version",                   :default => 0
  end

  add_index "ideas", ["name"], :name => "index_ideas_on_name", :unique => true

  create_table "infos", :force => true do |t|
    t.string   "writer",       :limit => 32,                :null => false
    t.integer  "idea_id",                                   :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "lock_version",               :default => 0
  end

  create_table "part2s", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "parts", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "pictures", ["imageable_id"], :name => "index_pictures_on_imageable_id"

  create_table "subscriptions", :force => true do |t|
    t.integer "attendee_id"
    t.string  "attendee_type"
    t.integer "part2_id"
  end

  create_table "xassemblies", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "xcomments", :force => true do |t|
    t.string   "user_name"
    t.text     "body"
    t.integer  "idea_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "xcomments", ["idea_id"], :name => "index_xcomments_on_idea_id"

  create_table "xinfos", :force => true do |t|
    t.string   "writer",     :null => false
    t.integer  "idea_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "xmails", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "yassemblies", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "ymails", :force => true do |t|
    t.string   "name",       :limit => 32
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
