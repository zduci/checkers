class TrackOrderController < ApplicationController
  respond_to :html, :json

  def track
    @order = RetrievesOrders.find_existing(params[:session_id])
    unless @order
      redirect_to :root
    end
  end

  def status
    respond_to do |format|
      format.json do
        order = RetrievesOrders.find_existing(params[:session_id])
        render :json => { 'status' => order.status }
      end
    end
  end
end
