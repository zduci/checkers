class Order < ActiveRecord::Base
  attr_accessible :item_orders, :status

  validates :item_orders, :status, :presence => true
end
