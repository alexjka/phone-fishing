class AddColumnToFavorite < ActiveRecord::Migration[5.0]

  def up
    add_column :favorites, :checked?, :boolean
    remove_column :reports, :favorite
  end

  def down
    add_column :reports, :favorite, :boolean
    remove_column :favorites, :checked?
  end
end
