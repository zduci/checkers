require 'spec_helper'

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

end
