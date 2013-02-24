class Item < ActiveRecord::Base
  attr_accessible :name, :price

  validates :name, :price, :presence => true
end
