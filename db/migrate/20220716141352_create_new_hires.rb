class CreateNewHires < ActiveRecord::Migration[7.0]
  def change
    create_table :new_hires do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :social, null: false
      t.string :rate, null: false
      t.date :birthdate, null: false
      t.references :position, null: false, foreign_key: true
      t.string :referred_by
      t.boolean :rehire, null: false, default: false
      t.string :notes
      t.string :hear, null: false
      t.boolean :attended, null: false, default: false
      t.string :requirements
      t.boolean :background_received, null: false, default: false
      t.boolean :background_ok, null: false, default: false
      t.string :comments
      t.boolean :background_na, null: false, default: false

      t.timestamps
    end
  end
end
