describe GetsItems do

  it 'retrieves single item' do
    id = 1
    item = stub
    Item.stub(:find).with(id) { item }
    GetsItems.item(id).should == item
  end

  it 'item rows' do
    Item.stub(:all) { [1, 2, 3, 4] }
    GetsItems.item_rows.should == [[1, 2, 3], [4]]
  end

end
