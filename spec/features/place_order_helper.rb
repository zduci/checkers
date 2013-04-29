module PlaceOrderHelper
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

    def place_order_log_in_and_visit_orders
      visit_menu
      select_quantity
      place_order
      order_url = current_url
      log_in
      visit_orders
      order_url
    end

    def log_in
      login_as(admin, :scope => :admin)
    end

    def visit_orders
      visit '/orders'
    end
end
