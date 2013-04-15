class ItemOrdersController < ApplicationController

  def create
    begin
      CreatesOrders.create(request_id,
                           params[:item],
                           params[:quantity])
    rescue Exception => e
      flash[:error] = "Could not add item to order"
    end
    redirect_to items_path
  end

  def request_id
    request.session_options[:id]
  end
end
