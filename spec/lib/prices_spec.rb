require_relative '../../lib/prices'

describe Prices do
  it 'computes the price of its items' do
    item = double(:price => 11)
    item_order = double(:item => item, 
                        :quantity => 4)
    Prices.for_item_order(item_order).should == 44
  end
end
