class CreatesOrders
  def self.create(request_id, item_id, quantity)
      order = RetrievesOrders.existing_or_create(request_id)
      item = Item.find(item_id)
      ItemOrder.create!(:quantity => quantity, 
                          :item => item, 
                          :order => order)
  end
end
