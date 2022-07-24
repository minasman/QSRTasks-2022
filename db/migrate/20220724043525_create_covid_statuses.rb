class CreateCovidStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :covid_statuses do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.references :store, null: false, foreign_key: true
      t.string :status, null: false
      t.references :user, null: false, foreign_key: true
      t.string :timecard, null: false

      t.timestamps
    end
  end
end
