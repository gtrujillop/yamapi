class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :total_price, default: 0.0
      t.integer :purchaseable_id, null: false
      t.string :purchaseable_type, null: false
      t.references :user_library, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
