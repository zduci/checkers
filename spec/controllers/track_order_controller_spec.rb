require 'spec_helper'

describe TrackOrderController do
  let(:session_id) { 'sessionid' }

  it 'returns order if it exists' do
    order = stub
    ManagesOrders.stub(:find_existing).with(session_id) { order }
    get :track, :session_id => session_id
    assigns[:order].should == order
  end

  it "redirects to root if order doesn't exist" do
    ManagesOrders.stub(:find_existing).with(session_id) { false }
    get :track, :session_id => session_id
    response.should redirect_to :root
  end

  it 'returns the status of an order' do
    status = 'current status'
    order = stub(:status => status)
    ManagesOrders.stub(:find_existing).with(session_id) { order }
    get :status, :session_id => session_id, :format => :json
    response.body.should == "{\"status\":\"current status\"}"
  end
end
