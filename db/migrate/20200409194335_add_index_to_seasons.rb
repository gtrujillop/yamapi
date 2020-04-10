class AddIndexToSeasons < ActiveRecord::Migration[6.0]
  def change
    add_index :seasons, [:title, :number]
    add_index :seasons, :plot, using: :gin
  end
end
