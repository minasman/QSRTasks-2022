class CreateTclasses < ActiveRecord::Migration[7.0]
  def change
    create_table :tclasses do |t|
      t.string :name, null: false
      t.references :instructor, null: false
      t.string :duration, null:false
      t.integer :capacity, null: false
      t.date :class_date, null: false
      t.time :class_time, null: false
      t.string :location, null: false
      t.references :curriculum, null: false, foreign_key: true
      t.string :expense, default: "0"

      t.timestamps
    end
  end
end
