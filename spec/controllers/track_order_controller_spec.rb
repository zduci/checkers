require 'spec_helper'

describe TrackOrderController do
  let(:session_id) { 'sessionid' }

  it 'returns order if it exists' do
    order = stub
    RetrievesOrders.stub(:find_existing).with(session_id) { order }
    get :track, :session_id => session_id
    assigns[:order].should == order
  end

  it "redirects to root if order doesn't exist" do
    RetrievesOrders.stub(:find_existing).with(session_id) { false }
    get :track, :session_id => session_id
    response.should redirect_to :root
  end
end
