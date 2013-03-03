require_relative '../../lib/retrieves_orders'

describe RetrievesOrders do
  it 'retrieves an existing order by request id' do
    order = stub
    Order.stub(:find_by_request_id).with('a request id') { order }
    RetrievesOrders.existing_or_create('a request id').should == order
  end

  it 'creates a new order if it does not exist' do
    Order.stub(:find_by_request_id).with('a request id') { nil }
    Order.should_receive(:create).with(:request_id => 'a request id',
                                       :status => 'pending')
    RetrievesOrders.existing_or_create('a request id')
  end
end
