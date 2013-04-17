require 'spec_helper'

describe "placing an order", :type => :feature do
    let(:item) { FactoryGirl.create(:item) }

    before(:each) do
      Item.stub(:all) { [ item ] }
    end

    it 'displays items' do
      visit '/menu'

      page.should have_content 'Cheese Pizza'
      page.should have_content 'Very cheesy'
      page.should have_content '9.99'
    end

    it "adds items to the basket" do
      visit '/menu'

      click_button 'Select quantity'
      puts page.body
      select '10', :from => 'quantity'

      click_button 'Add to order'
      page.should have_content 'Total Price 99.9'
    end

    it "places an order" do
      visit '/menu'

      click_button 'Select quantity'
      puts page.body
      select '10', :from => 'quantity'

      click_button 'Add to order'
      click_button 'Place order'
      page.should have_content 'Track your order in real time'
      page.should have_content 'Placed'
    end
end
