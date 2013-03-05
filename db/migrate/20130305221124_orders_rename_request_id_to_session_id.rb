class OrdersRenameRequestIdToSessionId < ActiveRecord::Migration
  def change
    rename_column :orders, :request_id, :session_id
  end
end
