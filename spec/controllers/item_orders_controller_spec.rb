require 'spec_helper'

describe ItemOrdersController do

  context 'order has not been placed yet' do
    it 'creates new item order' do
      order = stub
      item_id = '42'
      item = stub
      quantity = '1'
      RetrievesOrders.stub(:existing_or_create)  { order }
      Item.should_receive(:find).with(item_id) { item }
      ItemOrder.should_receive(:create!).with(:quantity => quantity,
                                              :item => item,
                                              :order => order)
      post :create, :item => item_id, :quantity => quantity
    end
  end

  context 'order has already been placed' do
    it 'creates new item order' do
      RetrievesOrders.stub(:existing_or_create) { throw Exception.new }
      post :create
      flash[:error].should == 'Could not add item to order'
    end
  end
end
