class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
      t.integer :quantity, :null => false
      t.integer :item_id , :null => false
      t.integer :order_id , :null => false

      t.timestamps
    end
  end
end
