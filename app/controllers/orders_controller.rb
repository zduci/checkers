class OrdersController < ApplicationController
  def create
    if RetrievesOrders.place_order(request.session_options[:id])
      redirect_to tracker_path
    else
      flash[:error] = "Order already placed"
      redirect_to items_path
    end
  end
end
