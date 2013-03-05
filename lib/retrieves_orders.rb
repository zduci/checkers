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
end
