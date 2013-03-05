require_relative '../../lib/retrieves_orders'

describe RetrievesOrders do

  context 'retrieves existing order or creates new one' do
    it 'retrieves an existing order by session id' do
      order = stub
      Order.stub(:find_by_session_id).with('a session id') { order }
      RetrievesOrders.existing_or_create('a session id').should == order
    end

    it 'creates a new order if it does not exist' do
      Order.stub(:find_by_session_id).with('a session id') { nil }
      Order.should_receive(:create).with(:session_id => 'a session id',
                                         :status => 'pending')
      RetrievesOrders.existing_or_create('a session id')
    end
  end

  context 'tries to find an existing order' do
    it "returns false if an order doesn't exist" do
      session_id = stub
      Order.stub(:find_by_session_id).with(session_id) { nil }
      RetrievesOrders.find_existing(session_id).should == false
    end
  end

  it 'places a order if it exists' do
    RetrievesOrders.stub(:find_existing) { false }
    #RetrievesOrders.place_order(order).should == 'lol'
  end
end
