class AddLongAndLatToSpots < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :lat, :string
    add_column :spots, :long, :string
  end
end
