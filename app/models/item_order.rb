class ItemOrder < ActiveRecord::Base
  attr_accessible :quantity, :order, :item
  belongs_to :item
  belongs_to :order
  validates_presence_of :quantity
end
