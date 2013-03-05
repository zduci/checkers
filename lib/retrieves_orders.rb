class RetrievesOrders
  def self.existing_or_create(session_id)
    order = find_existing(session_id)
    unless order
      order = Order.create(:status => 'pending',
                   :session_id => session_id)
    end
    order
  end

  def self.find_existing(session_id)
    Order.find_by_session_id(session_id) || false
  end

  def self.place_order(session_id)
    order = find_existing(session_id)
    if order && order.status == 'pending'
      order.update_attributes(:status => 'placed')
      true
    else
      false
    end
  end
end
