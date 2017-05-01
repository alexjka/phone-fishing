class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.string :description
      t.string :coordinates
      t.boolean :favorite, default: false

      t.belongs_to :user
      t.timestamps
    end
  end
end
