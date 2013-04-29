require 'spec_helper'
require_relative 'place_order_helper'

include PlaceOrderHelper
include Warden::Test::Helpers
Warden.test_mode!

describe 'changing an order status', :type => :feature do
    let(:admin) { FactoryGirl.create(:admin) }

    before(:all) do
      ActionController::Base.allow_forgery_protection = true
    end

    before(:each) do
      FactoryGirl.create(:item)
    end

    it 'allows admins to log in' do
      log_in
      visit_orders

      page.should have_content 'Logout'
    end

    it 'displays the initial order status' do
      place_order_log_in_and_visit_orders

      page.should have_content 'Status: Placed'
    end

    it 'can change the order status', :js => true do
      place_order_log_in_and_visit_orders

      click_on 'Update status'
      select 'Preparing', :from => 'status'
      click_on 'Update'

      page.should have_content 'Current status: Preparing'
    end

    it 'updates the order status the user sees', :js => true do
      order_url = place_order_log_in_and_visit_orders

      click_on 'Update status'
      select 'Preparing', :from => 'status'
      click_on 'Update'

      visit order_url
      page.should have_content 'Preparing'
    end
end
