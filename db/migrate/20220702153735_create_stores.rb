class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :safe, null: false
      t.string :headset, null: false
      t.string :store_type, null: false
      t.integer :ipad, null: false
      t.boolean :active, null: false, default: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
