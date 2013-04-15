class ItemOrdersController < ApplicationController

  def create
    begin
      CreatesItemOrders.create(session[:session_id],
                           params[:item],
                           params[:quantity])
    rescue Exception => e
      flash[:error] = "Could not add item to order"
    end
    redirect_to items_path
  end

end
