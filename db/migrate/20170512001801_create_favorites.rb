class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :spot
      t.belongs_to :user
      t.timestamps 
    end
  end
end
