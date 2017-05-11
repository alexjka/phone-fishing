class AddFavoriteDefaultToReports < ActiveRecord::Migration[5.0]
  def up
    change_column :reports, :favorite, :boolean, :default => false
  end

  def down
    change_column :reports, :favorite, :boolean, :default => nil
  end
end
