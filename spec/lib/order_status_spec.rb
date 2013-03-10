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
end
