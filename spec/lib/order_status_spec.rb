describe OrderStatus do
  it 'formats all statuses for select' do
    OrderStatus.for_select.should == [["Pending", "pending"], 
                                      ["Placed", "placed"], 
                                      ["Preparing", "preparing"], 
                                      ["Baking", "baking"], 
                                      ["Quality control", "quality control"], 
                                      ["Delivering", "delivering"], 
                                      ["Delivered", "delivered"]]
  end

  it 'retrieves all statuses' do
    OrderStatus.stub(:constants) { [:PENDING, :PLACED] }
    OrderStatus.stub(:const_get).with(:PENDING) { 'pending' }
    OrderStatus.stub(:const_get).with(:PLACED) { 'placed' }
    OrderStatus.all.should == ['pending', 'placed']
  end

  it 'checks whether a status exists' do
    OrderStatus.stub(:all) { ['pending'] }
    OrderStatus.includes('pending').should == true
    OrderStatus.includes('placed').should == false
  end
end
