class TrackOrderController < ApplicationController
  respond_to :html, :js

  def track
    @order = RetrievesOrders.find_existing(params[:session_id])
    unless @order
      redirect_to :root
    end
  end

  def status
    respond_to do |format|
      format.js do
        @order = RetrievesOrders.find_existing(params[:session_id])
        render 'update'
      end
    end
  end
end
