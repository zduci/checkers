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
end
