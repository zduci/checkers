require 'spec_helper'
include Devise::TestHelpers

describe OrdersController do
  context 'creats a new item' do
    it 'creates a new item' do
      order = stub
      RetrievesOrders.stub(:place_order) { true }
      RetrievesOrders.stub(:find_existing) { order } 
      get :create
      assigns[:order].should == order
    end

    it 'does not create a new item if it is already created and redirects to items path' do
      order = stub
      RetrievesOrders.stub(:place_order) { false }
      get :create
      response.should redirect_to(items_path)
    end
  end

  context 'listing all orders' do
    it 'works if logged in' do
      sign_in FactoryGirl.create(:admin)
      orders = stub
      Order.stub(:all) { orders }
      get :index
      assigns[:orders].should == orders
    end

    it 'fails if not logged in' do
      expect { get :index }.to raise_error NoMethodError
    end
  end

  context 'showing an order' do
    let(:id) { '1337' }

    it 'works if logged in' do
      sign_in FactoryGirl.create(:admin)
      order = stub
      statuses = stub
      RetrievesOrders.stub(:find_existing_by_id).with(id) { order }
      OrderStatus.stub(:for_select) { statuses }
      get :show, :id => id
      assigns[:order].should == order
      assigns[:statuses].should == statuses
    end

    it 'fails if not logged in' do
      expect { get :show, :id => id }.to raise_error NoMethodError
    end
  end
end
