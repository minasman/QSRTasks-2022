class CreateCommentUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_updates do |t|
      t.date :update_date, null: false
      t.time :update_time, null: false
      t.string :update_type, null: false
      t.string :current_update, null: false
      t.string :employee_name, null: false
      t.references :comment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
