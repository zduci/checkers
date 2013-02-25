class ItemOrder < ActiveRecord::Base
  attr_accessible :quantity
  belongs_to :item
  belongs_to :order
  validates_presence_of :quantity
end
