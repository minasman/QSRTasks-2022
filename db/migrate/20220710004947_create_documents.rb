class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :documentation_type, null: false
      t.string :documentation_class, null: false
      t.string :level, null: false
      t.string :definition, null: false
      t.integer :points, null: false

      t.timestamps
    end
  end
end
