class AddIndexToOrders < ActiveRecord::Migration[6.0]
  def change
    add_index :orders, [:purchaseable_id, :purchaseable_type]
  end
end
