class AddBirthdateToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :birthdate, :date
    add_column :users, :hire_date, :date
    add_column :users, :past_stores, :integer, array: true, default: []
  end
end
