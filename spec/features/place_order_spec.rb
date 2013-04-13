require 'spec_helper'
describe "placing an order", :type => :feature do

    it 'displays items' do
      Item.stub(:all) { [FactoryGirl.create(:item)] }
      visit '/menu'

      puts page.body
      page.should have_content 'Cheese Pizza'
      page.should have_content 'Very cheesy'
    end

end
