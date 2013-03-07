class OrdersController < ApplicationController
  def create
    session_id = request.session_options[:id]
    if RetrievesOrders.place_order(session_id)
      @order = RetrievesOrders.find_existing(session_id)
      reset_session
      redirect_to tracker_path(session_id)
    else
      flash[:error] = "Order already placed"
      redirect_to items_path
    end
  end

end
