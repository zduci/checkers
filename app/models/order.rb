class Order < ActiveRecord::Base
  attr_accessible :status, :item_orders, :session_id
  has_many :item_orders, :dependent => :destroy
  validates_presence_of :status 
end
