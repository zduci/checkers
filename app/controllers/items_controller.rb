require_relative '../../lib/gets_items'
require_relative '../../lib/item_quantities'

class ItemsController < ApplicationController

  def index
    @item_rows = GetsItems.item_rows
  end

  def show
    @item = GetsItems.item(params[:id])
    @quantities = ItemQuantities.max
  end
end
