class Item < ActiveRecord::Base
  attr_accessible :name, :price, :description
  has_many :item_orders
  validates_presence_of :name, :price
end
