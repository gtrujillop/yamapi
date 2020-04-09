class AddIndexToSeasons < ActiveRecord::Migration[6.0]
  def change
    add_index :seasons, [:title, :plot, :number]
  end
end
