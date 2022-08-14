class CreateFoodHandlerCards < ActiveRecord::Migration[7.0]
  def change
    create_table :food_handler_cards do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :issue_date
      t.date :expiration_date

      t.timestamps
    end
  end
end
