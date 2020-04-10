class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.text :title, null: false
      t.jsonb :plot, default: {}
      t.integer :number, null: false
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
