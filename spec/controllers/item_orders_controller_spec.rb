require 'spec_helper'

describe ItemOrdersController do

  context 'order has not been placed yet' do
    it 'creates new item order' do
      request_id = 'a request id'
      item_id = '42'
      quantity = '1'
      CreatesOrders.should_receive(:create).with(request_id, item_id, quantity)
      request.session_options.stub(:[]).with(:id) { request_id }
      post :create, :item => item_id, :quantity => quantity
    end
  end

  context 'order has already been placed' do
    it 'creates new item order' do
      CreatesOrders.stub(:create) { throw Exception.new }
      post :create
      flash[:error].should == 'Could not add item to order'
    end
  end
end
