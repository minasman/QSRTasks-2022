class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone
      t.string :contact
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
