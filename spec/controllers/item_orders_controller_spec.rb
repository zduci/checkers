require 'spec_helper'

describe ItemOrdersController do

  context 'order has not been placed yet' do
    it 'creates new item order' do
      item_id = '42'
      quantity = '1'
      CreatesItemOrders.should_receive(:create).with(session[:session_id], item_id, quantity)
      post :create, :item => item_id, :quantity => quantity
    end
  end

  context 'order has already been placed' do
    it 'creates new item order' do
      CreatesItemOrders.stub(:create) { throw Exception.new }
      post :create
      flash[:error].should == 'Could not add item to order'
    end
  end
end
