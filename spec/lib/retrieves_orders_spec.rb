require_relative '../../lib/retrieves_orders'

describe RetrievesOrders do
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
