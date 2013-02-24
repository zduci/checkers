class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status, :null => false
      t.integer :item_orders, :null => false

      t.timestamps
    end
  end
end
