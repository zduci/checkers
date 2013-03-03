class AddRequestIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :request_id, :string, :null => false
  end
end
