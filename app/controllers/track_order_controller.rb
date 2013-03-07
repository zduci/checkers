class TrackOrderController < ApplicationController
  def track
    @order = RetrievesOrders.find_existing(params[:session_id])
    unless @order
      redirect_to :root
    end
  end
end
