require 'spec_helper'
require_relative 'place_order_helper'

include PlaceOrderHelper

describe "placing an order", :type => :feature do
    before(:all) do
      ActionController::Base.allow_forgery_protection = true
    end

    before(:each) do
      FactoryGirl.create(:item)
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
end
