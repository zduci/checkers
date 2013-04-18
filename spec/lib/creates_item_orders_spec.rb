require 'spec_helper'

describe CreatesItemOrders do
  it 'creates a new item order' do
    request_id = 'a request id'
    order = stub
    item_id = '42'
    item = stub
    quantity = '1'
    ManagesOrders.stub(:existing_or_create).with(request_id)  { order }
    Item.should_receive(:find).with(item_id) { item }
    ItemOrder.should_receive(:create!).with(:quantity => quantity,
                                            :item => item,
                                            :order => order)
    CreatesItemOrders.create(request_id,
                         item_id,
                         quantity)
                        
  end
end
