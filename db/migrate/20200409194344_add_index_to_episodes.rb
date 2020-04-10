class AddIndexToEpisodes < ActiveRecord::Migration[6.0]
  def change
    add_index :episodes, [:title, :number]
    add_index :episodes, :plot, using: :gin
  end
end
