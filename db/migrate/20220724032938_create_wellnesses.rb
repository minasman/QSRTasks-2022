class CreateWellnesses < ActiveRecord::Migration[7.0]
  def change
    create_table :wellnesses do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :tc
      t.string :temp
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :q4
      t.boolean :reported

      t.timestamps
    end
  end
end
