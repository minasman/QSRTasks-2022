class CreateWorkorders < ActiveRecord::Migration[7.0]
  def change
    create_table :workorders do |t|
      t.references :store, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true
      t.references :equipment_area, null: false, foreign_key: true
      t.references :equipment_type, null: false, foreign_key: true
      t.string :workorder_issue, null: false
      t.string :status, default: "Open"
      t.integer :assigned, default: "NULL"
      t.string :level, default: "NULL"
      t.string :team, default: "NULL"
      t.references :vendor, null: false, foreign_key: true, default: 166

      t.timestamps
    end
  end
end
