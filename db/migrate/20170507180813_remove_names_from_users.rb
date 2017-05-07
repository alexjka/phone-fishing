class RemoveNamesFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :spots, :coordinates, :string
    remove_column :users, :last_name, :string
  end
end
