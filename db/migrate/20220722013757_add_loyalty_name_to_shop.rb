class AddLoyaltyNameToShop < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :loyalty_name, :string
    add_column :shops, :curbsideTotalTime, :string
  end
end
