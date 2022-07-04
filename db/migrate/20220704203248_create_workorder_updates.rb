class CreateWorkorderUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :workorder_updates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workorder, null: false, foreign_key: true
      t.string :current_update, null: false
      t.string :manager
      t.string :signature

      t.timestamps
    end
  end
end
