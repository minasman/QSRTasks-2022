class CreateOrganizaitons < ActiveRecord::Migration[7.0]
  def change
    create_table :organizaitons do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :street, null: false

      t.timestamps
    end
  end
end
