class Prices
  def self.for_item_order(item_order)
    item_order.quantity * item_order.item.price
  end

  def self.for_order(order)
    order.item_orders.inject(0) do |result, item_order| 
      result += for_item_order(item_order)
    end
  end
end
