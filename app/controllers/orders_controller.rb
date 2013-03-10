class OrdersController < ApplicationController
  before_filter :authenticate_admin!, :only => [:index]

  respond_to :html, :js

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

  def index
    @orders = Order.all
  end

  def show
    @order = RetrievesOrders.find_existing_by_id(params[:id])
    @statuses = OrderStatus.for_select
  end

  def update
    respond_to do |format|
      format.js do
        if RetrievesOrders.update_status(params[:id], params[:status])
          @order = RetrievesOrders.find_existing_by_id(params[:id])
          render 'success'
        else
          render :json => "fail"
        end
      end
    end
  end
end
