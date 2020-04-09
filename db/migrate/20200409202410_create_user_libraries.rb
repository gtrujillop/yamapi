class CreateUserLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :user_libraries do |t|
      t.references :user, null: false, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
