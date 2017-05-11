class AddFavoriteToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :favorite, :boolean
  end
end
