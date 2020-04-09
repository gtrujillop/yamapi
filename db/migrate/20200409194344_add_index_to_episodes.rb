class AddIndexToEpisodes < ActiveRecord::Migration[6.0]
  def change
    add_index :episodes, [:title, :plot, :number]
  end
end
