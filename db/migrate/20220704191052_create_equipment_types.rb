class CreateEquipmentTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_types do |t|
      t.string :name, null: false
      t.references :equipment_area, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
