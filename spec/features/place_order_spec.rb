require 'spec_helper'
describe "placing an order", :type => :feature do
    before(:each) do
      Item.stub(:all) { [FactoryGirl.create(:item)] }
    end

    it 'displays items' do
      visit '/menu'

      page.should have_content 'Cheese Pizza'
      page.should have_content 'Very cheesy'
      page.should have_content '9.99'
    end
end
