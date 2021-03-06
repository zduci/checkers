class ManagesOrders
  def self.existing_or_create(session_id)
    order = find_existing(session_id)
    if order
      check_is_pending(order)
    else
      order = Order.create(:status => OrderStatus::PENDING,
                           :session_id => session_id)
    end
    order
  end

  def self.find_existing(session_id)
    Order.find_by_session_id(session_id) || false
  end

  def self.find_existing_by_id(id)
    Order.find(id) || false
  end

  def self.place_order(session_id)
    order = find_existing(session_id)
    if order && order.status == OrderStatus::PENDING
      order.update_attributes(:status => OrderStatus::PLACED)
      order
    else
      fail InvalidOrderException.new
    end
  end

  def self.update_status(id, status)
    return false unless OrderStatus.includes(status) 
    order = find_existing_by_id(id)
    return false if order.status == OrderStatus::DELIVERED
    order.update_attributes!(:status => status)
  end

  private

  def self.check_is_pending(order)
    throw Exception.new unless order.status == OrderStatus::PENDING
  end

  class InvalidOrderException < StandardError
  end
end
