require 'spec_helper'
require_relative 'place_order_helper'

include PlaceOrderHelper
include Warden::Test::Helpers
Warden.test_mode!

describe 'changing an order status', :type => :feature do
    let(:item) { FactoryGirl.create(:item) }
    let(:admin) { FactoryGirl.create(:admin) }

    before(:all) do
      ActionController::Base.allow_forgery_protection = true
    end

    before(:each) do
      Item.stub(:all) { [ item ] }
    end

    it 'allows admins to log in' do
      log_in
      visit_orders

      page.should have_content 'Logout'
    end

    def log_in
      login_as(admin, :scope => :admin)
    end

    def visit_orders
      visit '/orders'
    end
end
