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

ActiveRecord::Schema.define(:version => 20120910140703) do

  create_table "clothing_ostalos", :force => true do |t|
    t.integer  "user_id"
    t.string   "naslov"
    t.string   "opis"
    t.string   "cijena"
    t.boolean  "zamjena"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slika_file_name"
    t.string   "slika_content_type"
    t.integer  "slika_file_size"
    t.datetime "slika_updated_at"
  end

  add_index "clothing_ostalos", ["user_id", "created_at"], :name => "index_clothing_ostalos_on_user_id_and_created_at"

  create_table "decks", :force => true do |t|
    t.integer  "user_id"
    t.string   "marka"
    t.string   "sirina_daske"
    t.boolean  "sa_gripom"
    t.string   "koristenost"
    t.string   "starost"
    t.boolean  "zamjena"
    t.string   "cijena"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "dodatan_opis"
    t.string   "slika_file_name"
    t.string   "slika_content_type"
    t.integer  "slika_file_size"
    t.datetime "slika_updated_at"
  end

  add_index "decks", ["user_id", "created_at"], :name => "index_decks_on_user_id_and_created_at"

  create_table "garments", :force => true do |t|
    t.integer  "user_id"
    t.string   "naslov"
    t.string   "vrsta"
    t.string   "marka"
    t.string   "velicina"
    t.string   "koristenost"
    t.string   "starost"
    t.boolean  "zamjena"
    t.string   "cijena"
    t.string   "dodatan_opis"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slika_file_name"
    t.string   "slika_content_type"
    t.integer  "slika_file_size"
    t.datetime "slika_updated_at"
  end

  add_index "garments", ["user_id", "created_at"], :name => "index_garments_on_user_id_and_created_at"

  create_table "hats", :force => true do |t|
    t.integer  "user_id"
    t.string   "naslov"
    t.string   "marka"
    t.string   "velicina"
    t.string   "koristenost"
    t.string   "starost"
    t.boolean  "zamjena"
    t.string   "cijena"
    t.string   "dodatan_opis"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slika_file_name"
    t.string   "slika_content_type"
    t.integer  "slika_file_size"
    t.datetime "slika_updated_at"
  end

  add_index "hats", ["user_id", "created_at"], :name => "index_hats_on_user_id_and_created_at"

  create_table "shoes", :force => true do |t|
    t.integer  "user_id"
    t.string   "naslov"
    t.string   "marka"
    t.string   "velicina"
    t.string   "koristenost"
    t.string   "starost"
    t.boolean  "zamjena"
    t.string   "cijena"
    t.string   "dodatan_opis"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slika_file_name"
    t.string   "slika_content_type"
    t.integer  "slika_file_size"
    t.datetime "slika_updated_at"
  end

  add_index "shoes", ["user_id", "created_at"], :name => "index_shoes_on_user_id_and_created_at"

  create_table "skate_ostalos", :force => true do |t|
    t.integer  "user_id"
    t.string   "naslov"
    t.string   "opis"
    t.string   "cijena"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slika_file_name"
    t.string   "slika_content_type"
    t.integer  "slika_file_size"
    t.datetime "slika_updated_at"
  end

  add_index "skate_ostalos", ["user_id", "created_at"], :name => "index_skate_ostalos_on_user_id_and_created_at"

  create_table "skates", :force => true do |t|
    t.integer  "user_id"
    t.string   "koristenost"
    t.string   "daska_marka"
    t.string   "daska_sirina"
    t.string   "osovine_marka"
    t.string   "osovine_sirina"
    t.string   "kotaci_marka"
    t.string   "kotaci_radijus"
    t.boolean  "sa_gripom"
    t.string   "cijena"
    t.string   "dodatan_opis"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slika_file_name"
    t.string   "slika_content_type"
    t.integer  "slika_file_size"
    t.datetime "slika_updated_at"
  end

  add_index "skates", ["user_id", "created_at"], :name => "index_skates_on_user_id_and_created_at"

  create_table "trucks", :force => true do |t|
    t.integer  "user_id"
    t.string   "marka"
    t.string   "sirina1"
    t.string   "sirina2"
    t.string   "visina"
    t.string   "koristenost"
    t.string   "starost"
    t.boolean  "zamjena"
    t.string   "cijena"
    t.string   "dodatan_opis"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slika_file_name"
    t.string   "slika_content_type"
    t.integer  "slika_file_size"
    t.datetime "slika_updated_at"
  end

  add_index "trucks", ["user_id", "created_at"], :name => "index_trucks_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "password_digest"
    t.string   "remeber_token"
    t.string   "phone_number"
    t.string   "county"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remeber_token"], :name => "index_users_on_remeber_token"

  create_table "wheels", :force => true do |t|
    t.integer  "user_id"
    t.string   "marka"
    t.string   "radijus"
    t.string   "koristenost"
    t.string   "starost"
    t.boolean  "zamjena"
    t.string   "cijena"
    t.string   "dodatan_opis"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slika_file_name"
    t.string   "slika_content_type"
    t.integer  "slika_file_size"
    t.datetime "slika_updated_at"
  end

end
