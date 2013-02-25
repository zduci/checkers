class AddItemOrderIndices < ActiveRecord::Migration
  def up
    add_index :item_orders, :item_id
    add_index :item_orders, :order_id
  end

  def down
    remove_index :item_orders, :item_id
    remove_index :item_orders, :order_id
  end
end
