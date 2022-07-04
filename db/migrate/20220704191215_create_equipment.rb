class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :name, null: false
      t.date :service_date, null: false
      t.string :equipment_tag, null: false
      t.references :store, null: false, foreign_key: true
      t.references :equipment_type, null: false, foreign_key: true
      t.references :equipment_area, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
