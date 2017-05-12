class ChangeColumnFavorites < ActiveRecord::Migration[5.0]

  def up
    remove_column :favorites, :checked?
  end

  def down
    add_column :favorites, :checked?, :boolean
  end
end
