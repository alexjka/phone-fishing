class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.text :body, null: false

      t.belongs_to :spot
      t.belongs_to :user
      t.timestamps
    end
  end
end
