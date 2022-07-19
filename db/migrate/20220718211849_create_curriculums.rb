class CreateCurriculums < ActiveRecord::Migration[7.0]
  def change
    create_table :curriculums do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.string :class_type, null: false
      t.references :organization, null: false, foreign_key: true
      t.boolean :current, null: false, default: true

      t.timestamps
    end
  end
end
