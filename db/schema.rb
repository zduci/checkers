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

ActiveRecord::Schema.define(:version => 20130303192709) do

  create_table "item_orders", :force => true do |t|
    t.integer  "quantity",   :null => false
    t.integer  "item_id",    :null => false
    t.integer  "order_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "item_orders", ["item_id"], :name => "index_item_orders_on_item_id"
  add_index "item_orders", ["order_id"], :name => "index_item_orders_on_order_id"

  create_table "items", :force => true do |t|
    t.string   "name",        :null => false
    t.float    "price",       :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description", :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "status",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "request_id", :null => false
  end

end
