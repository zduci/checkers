require 'spec_helper'

describe "placing an order", :type => :feature do
    let(:item) { FactoryGirl.create(:item) }

    before(:all) do
      ActionController::Base.allow_forgery_protection = true
    end

    before(:each) do
      Item.stub(:all) { [ item ] }
    end

    it 'displays items' do
      visit_menu

      page.should have_content 'Cheese Pizza'
      page.should have_content 'Very cheesy'
      page.should have_content '9.99'
    end

    it "adds items to the basket" do
      visit_menu
      select_quantity

      page.should have_content 'Total Price 99.9'
    end

    it "places an order" do
      visit_menu
      select_quantity
      place_order

      page.should have_content 'Track your order in real time'
      page.should have_content 'Placed'
    end

    def visit_menu
      visit '/menu'
    end

    def select_quantity
      click_button 'Select quantity'
      select '10', :from => 'quantity'
      click_button 'Add to order'
    end

    def place_order
      click_button 'Place order'
    end
end
