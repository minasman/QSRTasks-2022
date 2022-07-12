class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.string :name, null: false
      t.integer :value, null: false
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
