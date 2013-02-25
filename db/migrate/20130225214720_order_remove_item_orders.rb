class OrderRemoveItemOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :item_orders
  end

  def down
    create_column :orders, :item_orders, :integer
  end
end
