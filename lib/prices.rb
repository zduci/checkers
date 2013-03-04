class Prices
  def self.for_item_order(item_order)
    item_order.quantity * item_order.item.price
  end
end
