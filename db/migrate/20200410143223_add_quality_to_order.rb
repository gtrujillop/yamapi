class AddQualityToOrder < ActiveRecord::Migration[6.0]
  def up
    execute <<-DDL
      CREATE TYPE video_quality AS ENUM ('standard', 'hd', 'full_hd');
    DDL
    add_column :orders, :quality, :video_quality
    add_index :orders, :quality
  end

  def down
    remove_column :orders, :video_quality
    execute "DROP type video_quality;"
  end
  
end
