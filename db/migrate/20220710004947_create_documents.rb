class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :documentation_type
      t.string :documentation_class
      t.string :level
      t.string :definition
      t.string :description
      t.integer :points

      t.timestamps
    end
  end
end
