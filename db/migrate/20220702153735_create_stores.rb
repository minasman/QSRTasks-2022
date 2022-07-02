class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :number
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :safe
      t.string :headset
      t.string :store_type
      t.string :active
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
