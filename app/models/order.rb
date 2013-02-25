class Order < ActiveRecord::Base
  attr_accessible :status, :item_orders
  has_many :item_orders
  validates_presence_of :status 
end
