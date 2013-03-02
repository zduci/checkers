require_relative '../../lib/item_quantities'

describe ItemQuantities do
  it 'creates the array of values for a max quantity' do
    ItemQuantities.create_for(2).should == [[1, 1], [2, 2]]
  end

  it 'creates the array of values for the max quantity of orderable items' do
    ItemQuantities.max.should == ItemQuantities.create_for(ItemQuantities::MAX_QUANTITY)

  end
end
