class ItemOrdersController < ApplicationController

  def create
    begin
      order = RetrievesOrders.existing_or_create(request_id)
      item = Item.find(params[:item])
      ItemOrder.create!(:quantity => params[:quantity], 
                          :item => item, 
                          :order => order)
    rescue Exception => e
      puts e
      flash[:error] = "Could not add item to order"
    end
    redirect_to items_path
  end

  def request_id
    request.session_options[:id]
  end

end
