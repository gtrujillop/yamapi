class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.text :title, null: false
      t.jsonb :plot, default: {}
      t.integer :number, null: false
      t.float :unit_price, default: 0.0
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
