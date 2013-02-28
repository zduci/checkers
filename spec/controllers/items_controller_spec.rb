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
    GetsItems.stub(:item).with(id) { item }
    get :show, :id => id
    assigns[:item].should == item
  end

end
