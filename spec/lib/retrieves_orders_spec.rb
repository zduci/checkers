require_relative '../../lib/retrieves_orders'

describe RetrievesOrders do

  context 'retrieves existing order or creates new one' do
    it 'retrieves an existing order by session id' do
      order = stub(:status => 'pending')
      Order.stub(:find_by_session_id).with('a session id') { order }
      RetrievesOrders.existing_or_create('a session id').should == order
    end

    it 'creates a new order if it does not exist' do
      Order.stub(:find_by_session_id).with('a session id') { nil }
      Order.should_receive(:create).with(:session_id => 'a session id',
                                         :status => 'pending')
      RetrievesOrders.existing_or_create('a session id')
    end

    it 'throws an exception if the order exists but is not pending' do
      order = stub(:status => 'not pending')
      Order.stub(:find_by_session_id).with('a session id') { order }
      expect { RetrievesOrders.existing_or_create('a session id') }.to raise_error
    end
  end

  context 'tries to find an existing order' do
    it "returns false if an order doesn't exist" do
      session_id = stub
      Order.stub(:find_by_session_id).with(session_id) { nil }
      RetrievesOrders.find_existing(session_id).should == false
    end

    it "find order by id" do
      order = stub
      id = stub
      Order.stub(:find).with(id) { order }
      RetrievesOrders.find_existing_by_id(id).should == order
    end
  end

  context 'tries to place an order' do
    let(:session_id) { stub }

    it "places an order if it exists and status is pending" do
      order = mock(:status => 'pending')
      order.should_receive(:update_attributes).with(:status => 'placed')
      RetrievesOrders.stub(:find_existing).with(session_id) { order }
      RetrievesOrders.place_order(session_id).should == true
    end
    
    it "returns false if the order's status is not pending" do
      order = mock(:status => 'not pending')
      RetrievesOrders.stub(:find_existing).with(session_id) { order }
      RetrievesOrders.place_order(session_id).should == false
    end
    
    it "returns false if the order does not exist" do
      RetrievesOrders.stub(:find_existing).with(session_id) { false }
      RetrievesOrders.place_order(session_id).should == false
    end
  end
end
