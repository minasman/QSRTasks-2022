class CreateDocumentations < ActiveRecord::Migration[7.0]
  def change
    create_table :documentations do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :employee_named, null: false, foreign_key: true
      t.references :awarded_by, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true
      t.string :documentation_type, null: false
      t.string :level, null: false
      t.string :documentation_class, null: false
      t.string :description, null: false
      t.string :points
      t.string :document_date, null: false
      t.boolean :individiual, default: false
      t.string :document_description, null: false

      t.timestamps
    end
  end
end
