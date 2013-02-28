require_relative '../../lib/gets_items'
class ItemsController < ApplicationController

  def index
    @item_rows = GetsItems.item_rows
  end

  def show
    @item = GetsItems.item(params[:id])
  end

end
