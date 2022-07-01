class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :name, null: false
      t.string :department, null: false
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
