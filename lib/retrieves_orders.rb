class RetrievesOrders
  def self.existing_or_create(request_id)
    order = find_existing(request_id)
    unless order
      order = Order.create(:status => 'pending',
                   :request_id => request_id)
    end
    order
  end

  def self.find_existing(request_id)
    Order.find_by_request_id(request_id)
  end
end
