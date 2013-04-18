require 'spec_helper'

describe ManagesOrders do

  context 'retrieves existing order or creates new one' do
    it 'retrieves an existing order by session id' do
      order = stub(:status => 'pending')
      Order.stub(:find_by_session_id).with('a session id') { order }
      ManagesOrders.existing_or_create('a session id').should == order
    end

    it 'creates a new order if it does not exist' do
      Order.stub(:find_by_session_id).with('a session id') { nil }
      Order.should_receive(:create).with(:session_id => 'a session id',
                                         :status => 'pending')
      ManagesOrders.existing_or_create('a session id')
    end

    it 'throws an exception if the order exists but is not pending' do
      order = stub(:status => 'not pending')
      Order.stub(:find_by_session_id).with('a session id') { order }
      expect { ManagesOrders.existing_or_create('a session id') }.to raise_error
    end
  end

  context 'tries to find an existing order' do
    it "returns false if an order doesn't exist" do
      session_id = stub
      Order.stub(:find_by_session_id).with(session_id) { nil }
      ManagesOrders.find_existing(session_id).should == false
    end

    it "find order by id" do
      order = stub
      id = stub
      Order.stub(:find).with(id) { order }
      ManagesOrders.find_existing_by_id(id).should == order
    end
  end

  context 'tries to place an order' do
    let(:session_id) { stub }

    it "places an order if it exists and status is pending" do
      order = mock(:status => 'pending')
      order.should_receive(:update_attributes).with(:status => 'placed')
      ManagesOrders.stub(:find_existing).with(session_id) { order }
      ManagesOrders.place_order(session_id).should == order
    end
    
    it "returns false if the order's status is not pending" do
      order = mock(:status => 'not pending')
      ManagesOrders.stub(:find_existing).with(session_id) { order }
      expect { ManagesOrders.place_order(session_id) }.to raise_error
    end
    
    it "returns false if the order does not exist" do
      ManagesOrders.stub(:find_existing).with(session_id) { false }
      expect { ManagesOrders.place_order(session_id) }.to raise_error
    end
  end

  context "tries to update an order's status" do
    let(:id) { stub }
    let(:order) { double(:status => OrderStatus::PLACED) }

    it "updates the order's status" do
      order.should_receive(:update_attributes!).with(:status => OrderStatus::DELIVERED) { true }
      ManagesOrders.stub(:find_existing_by_id).with(id) { order }
      ManagesOrders.update_status(id, OrderStatus::DELIVERED).should == true
    end

    it "does not update an order with an invalid status" do
      ManagesOrders.stub(:find_existing_by_id).with(id) { order }
      ManagesOrders.update_status(id, 'invalid status').should == false
    end

    it "does not update a delivered order" do
      ManagesOrders.stub(:find_existing_by_id).with(id) { stub(:status => OrderStatus::DELIVERED) }
      ManagesOrders.update_status(id, OrderStatus::DELIVERED).should == false
    end
  end
end
