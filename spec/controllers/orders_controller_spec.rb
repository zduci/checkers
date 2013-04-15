require 'spec_helper'
include Devise::TestHelpers

describe OrdersController do
  context 'when logged in' do
    before(:each) do
      sign_in FactoryGirl.create(:admin)
    end

    let(:id) { '1337' }
    let(:order) { stub }
    let(:status) { stub }
    let(:statuses) { stub }

    it 'lists all orders' do
      orders = stub
      Order.stub(:all) { orders }
      get :index
      assigns[:orders].should == orders
    end

    it 'shows an individual order' do
      RetrievesOrders.stub(:find_existing_by_id).with(id) { order }
      OrderStatus.stub(:for_select) { statuses }
      get :show, :id => id
      assigns[:order].should == order
      assigns[:statuses].should == statuses
    end

    context 'updating an order' do
        it 'renders success template if it can update status' do
          RetrievesOrders.stub(:update_status).with(id, status) { true }
          RetrievesOrders.stub(:find_existing_by_id).with(id) { order }
          post :update, :format => :js, :id => id, :status => status
          response.should render_template("success")
        end

        it "returns fail if it can't update status" do
          RetrievesOrders.stub(:update_status).with(id, status) { false }
          post :update, :format => :js, :id => id, :status => status
          response.body.should == 'fail'
        end
    end
  end

  context 'when not logged in' do
    it 'does not list orders' do
      expect { get :index }.to raise_error Exception
    end

    it 'does not show individual orders' do
      expect { get :show, :id => id }.to raise_error Exception
    end

    it 'fails if not logged in' do
      expect { post :update, :id => id }.to raise_error Exception
    end

    context 'creates a new item' do
      it 'creates a new item' do
        order = stub
        RetrievesOrders.stub(:place_order) { order }
        post :create
        assigns[:order].should == order
      end

      it 'does not create a new item if it is already created and redirects to items path' do
        RetrievesOrders.stub(:place_order).and_raise(RetrievesOrders::InvalidOrderException.new)
        post :create
        response.should redirect_to(items_path)
      end
    end
  end
end
