require 'spec_helper'

describe ItemsController do
  it 'returns the items rows' do
    item_rows = stub
    GetsItems.stub(:item_rows => item_rows)
    get :index
    assigns[:item_rows].should == item_rows
  end

  it 'returns an item' do
    id = "42"
    item = stub
    max = stub
    GetsItems.stub(:item).with(id) { item }
    ItemQuantities.stub(:max) { max }
    get :show, :id => id
    assigns[:item].should == item
    assigns[:quantities].should == max
  end

end
