class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.text :title, null: false
      t.integer :plot, null: false, default: 0
      t.float :unit_price, default: 0.0
      
      t.timestamps
    end
  end
end
