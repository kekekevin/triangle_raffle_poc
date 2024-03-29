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

ActiveRecord::Schema.define(:version => 20121227042421) do

  create_table "basic_order_details", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "quantity"
    t.string   "phone"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "orderable_id"
    t.string   "orderable_type"
  end

  create_table "electronic_raffle_orders", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "email"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.decimal  "total",      :precision => 2, :scale => 8, :default => 0.0, :null => false
  end

end
