class AddIndexToMovies < ActiveRecord::Migration[6.0]
  def change
    add_index :movies, :title
    add_index :movies, :plot, using: :gin
  end
end
