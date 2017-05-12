class AddColumnToFavorites < ActiveRecord::Migration[5.0]

  def up
    add_column :favorites, :checked?, :boolean, default: false
  end

  def down
    remove_column :favorites, :checked?
  end
end
