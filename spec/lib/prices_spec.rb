require_relative '../../lib/prices'

describe Prices do
  it "computes the price of an item order's items" do
    item = double(:price => 11)
    item_order = double(:item => item, 
                        :quantity => 4)
    Prices.for_item_order(item_order).should == 44
  end

  it "computes the price of an order's items" do
    first_item = stub(:price => 10)
    second_item = stub(:price => 16)
    order_items = [stub(:item => first_item, :quantity => 1),
                   stub(:item => second_item, :quantity => 2)]
    order = stub(:item_orders => order_items)
    Prices.for_order(order).should == 42
  end
end
