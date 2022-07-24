class CreateWellnesses < ActiveRecord::Migration[7.0]
  def change
    create_table :wellnesses do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :tc, null: false, default: 0
      t.string :temp, null: false
      t.string :q1, null: false
      t.string :q2, null: false
      t.string :q3, null: false
      t.string :q4, null: false
      t.boolean :reported

      t.timestamps
    end
  end
end
