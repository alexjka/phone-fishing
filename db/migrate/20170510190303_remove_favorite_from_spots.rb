class RemoveFavoriteFromSpots < ActiveRecord::Migration[5.0]
  def up
    remove_column :spots, :favorite
  end

  def down
    add_column :spots, :favorite, :boolean
  end
end
